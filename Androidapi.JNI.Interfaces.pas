unit Androidapi.JNI.Interfaces;

interface

uses
  System.SysUtils, System.Rtti, System.TypInfo,
  System.Generics.Collections, Androidapi.Jni, Androidapi.JNIBridge,
  Androidapi.JNIMarshal, Androidapi.JNI.JavaTypes, Androidapi.JNI.Java.Security;


type
  JSecretKey = interface;
  JKeyGenerator = interface;
  JKeyGenParameterSpec_Builder = interface;
  JKeyGenParameterSpec = interface;
  JKeyProperties = interface;
  JGCMParameterSpec = interface;
  JCipher = interface;


  JSecretKeyClass = interface(JKeyClass)
    ['{D8FB5EF9-221A-47A6-98E1-2A2099B06E2A}']
  end;

  [JavaSignature('javax/crypto/SecretKey')]
  JSecretKey = interface(JKey)
    ['{0AC623B0-EDEE-457D-8FE5-69075B89F68F}']
  end;
  TJSecretKey = class(TJavaGenericImport<JSecretKeyClass, JSecretKey>) end;



  JKeyGeneratorClass = interface(JObjectClass)
    ['{27B06B6F-CC82-41C5-B51C-645F33791378}']
    function getInstance(algorithm: JString): JKeyGenerator; cdecl; overload;
    function getInstance(algorithm: JString; provider: JString): JKeyGenerator; cdecl; overload;
  end;

  [JavaSignature('javax/crypto/KeyGenerator')]
  JKeyGenerator = interface(JObject)
    ['{2BCD267B-E9FB-450A-82E0-B88EF3D95D37}']
    procedure init(keysize: Integer); cdecl; overload;
    procedure init(keysize: Integer; random: JSecureRandom); cdecl; overload;
    procedure init(params: JAlgorithmParameterSpec); cdecl; overload;
    procedure init(params: JAlgorithmParameterSpec; random: JSecureRandom); cdecl; overload;
    function generateKey: JSecretKey; cdecl;
    function getAlgorithm: JString; cdecl;
  end;
  TJKeyGenerator = class(TJavaGenericImport<JKeyGeneratorClass, JKeyGenerator>) end;



  JKeyGenParameterSpec_BuilderClass = interface(JObjectClass)
    ['{5397263B-1169-4F51-A376-8724F015882E}']
    {class} function init(alias: JString; purposes: Integer): JKeyGenParameterSpec_Builder; cdecl;
  end;

  [JavaSignature('android/security/keystore/KeyGenParameterSpec$Builder')]
  JKeyGenParameterSpec_Builder = interface(JObject)
    ['{34EE23AA-8488-404B-9777-051BE3CE2274}']
    function setBlockModes(modes: TJavaObjectArray<JString>): JKeyGenParameterSpec_Builder; cdecl;
    function setEncryptionPaddings(paddings: TJavaObjectArray<JString>): JKeyGenParameterSpec_Builder; cdecl;
    function setKeySize(size: Integer): JKeyGenParameterSpec_Builder; cdecl;
    function build: JKeyGenParameterSpec; cdecl;
  end;
  TJKeyGenParameterSpec_Builder = class(TJavaGenericImport<JKeyGenParameterSpec_BuilderClass, JKeyGenParameterSpec_Builder>) end;

  [JavaSignature('android/security/keystore/KeyGenParameterSpec')]
  JKeyGenParameterSpec = interface(JAlgorithmParameterSpec)
    ['{665131D8-DB16-486B-9963-C086BB07F577}']
  end;


  [JavaSignature('android/security/keystore/KeyProperties')]
  JKeyPropertiesClass = interface(JObjectClass)
    ['{A3F9DB78-432E-4B50-BCC9-3D2773068AD8}']
    {class} function _GetPURPOSE_ENCRYPT: Integer; cdecl;
    {class} function _GetPURPOSE_DECRYPT: Integer; cdecl;
    {class} function _GetBLOCK_MODE_GCM: JString; cdecl;
    {class} function _GetENCRYPTION_PADDING_NONE: JString; cdecl;

    {class} property PURPOSE_ENCRYPT: Integer read _GetPURPOSE_ENCRYPT;
    {class} property PURPOSE_DECRYPT: Integer read _GetPURPOSE_DECRYPT;
    {class} property BLOCK_MODE_GCM: JString read _GetBLOCK_MODE_GCM;
    {class} property ENCRYPTION_PADDING_NONE: JString read _GetENCRYPTION_PADDING_NONE;
  end;

  [JavaSignature('android/security/keystore/KeyProperties')]
  JKeyProperties = interface(JObject)
    ['{B678576C-8911-4677-8F41-B9DBA70223F3}']
  end;
  TJKeyProperties = class(TJavaGenericImport<JKeyPropertiesClass, JKeyProperties>) end;


  JGCMParameterSpecClass = interface(JAlgorithmParameterSpecClass)
    ['{28F0EE6A-685D-469B-B81E-D3890DBBADF4}']
     {class} function init(tagLength: Integer; iv: TJavaArray<Byte>): JGCMParameterSpec; cdecl;
  end;

  [JavaSignature('javax/crypto/spec/GCMParameterSpec')]
  JGCMParameterSpec = interface(JAlgorithmParameterSpec)
    ['{7B8D1279-0C73-469F-B84C-E700E885CE84}']
  end;

   TJGCMParameterSpec = class(TJavaGenericImport<JGCMParameterSpecClass, JGCMParameterSpec>) end;


   JCipherClass = interface(JObjectClass)
     ['{90F8B73D-D10F-4286-BE7F-3A45A8F05704}']
    {class} function getInstance(transformation: JString): JCipher; cdecl; overload;
    {class} function getInstance(transformation: JString; provider: JString): JCipher; cdecl; overload;
    {class} function getMaxAllowedKeyLength(transformation: JString): Integer; cdecl;
   end;

   [JavaSignature('javax/crypto/Cipher')]
   JCipher = interface(JObject)
     ['{D45119DC-34C1-499F-A1F5-91FA6B16CE6A}']
    procedure init(opmode: Integer; key: JKey); cdecl; overload;
    procedure init(opmode: Integer; key: JKey; params: JAlgorithmParameterSpec); cdecl; overload;
    function doFinal(input: TJavaArray<Byte>): TJavaArray<Byte>; cdecl; overload;
    function doFinal(input: TJavaArray<Byte>; offset: Integer; len: Integer): TJavaArray<Byte>; cdecl; overload;
    function getIV: TJavaArray<Byte>; cdecl;
   end;

   TCipher = class(TJavaGenericImport<JCipherClass, JCipher>) end;

implementation


initialization
  TRegTypes.RegisterType('javax/crypto/SecretKey', TypeInfo(JSecretKeyClass));
  TRegTypes.RegisterType('javax/crypto/SecretKey', TypeInfo(JSecretKey));
  TRegTypes.RegisterType('javax/crypto/KeyGenerator', TypeInfo(JKeyGeneratorClass));
  TRegTypes.RegisterType('javax/crypto/KeyGenerator', TypeInfo(JKeyGenerator));
  TRegTypes.RegisterType('android/security/keystore/KeyGenParameterSpec$Builder', TypeInfo(JKeyGenParameterSpec_BuilderClass));
  TRegTypes.RegisterType('android/security/keystore/KeyGenParameterSpec$Builder', TypeInfo(JKeyGenParameterSpec_Builder));
  TRegTypes.RegisterType('android/security/keystore/KeyGenParameterSpec', TypeInfo(JKeyGenParameterSpec));
  TRegTypes.RegisterType('android/security/KeyProperties', TypeInfo(JKeyPropertiesClass));
  TRegTypes.RegisterType('android/security/KeyProperties', TypeInfo(JKeyProperties));
  TRegTypes.RegisterType('javax/crypto/spec/GCMParameterSpec', TypeInfo(JGCMParameterSpecClass));
  TRegTypes.RegisterType('javax/crypto/spec/GCMParameterSpec', TypeInfo(JGCMParameterSpec));
  TRegTypes.RegisterType('javax/crypto/Cipher', TypeInfo(JCipherClass));
  TRegTypes.RegisterType('javax/crypto/Cipher', TypeInfo(JCipher));


end.

