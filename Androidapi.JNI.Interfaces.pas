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
  JKeyPropertiesClass = interface;

  JSecretKeyClass = interface(JObjectClass)
    ['{D8FB5EF9-221A-47A6-98E1-2A2099B06E2A}']
  end;

  [JavaSignature('javax/crypto/SecretKey')]
  JSecretKey = interface(JObject)
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
     function init(alias: JString; purposes: Integer): JKeyGenParameterSpec_Builder; cdecl;
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



   JKeyGenParameterSpec = interface(JAlgorithmParameterSpec)
     ['{665131D8-DB16-486B-9963-C086BB07F577}']
   end;

   JKeyPropertiesClass = interface(JObjectClass)
     ['{A3F9DB78-432E-4B50-BCC9-3D2773068AD8}']
     function getPURPOSE_ENCRYPT: Integer; cdecl;
     function getPURPOSE_DECRYPT: Integer; cdecl;
   end;

   JKeyProperties = interface(JObject)
     ['{B678576C-8911-4677-8F41-B9DBA70223F3}']
   end;

   TJKeyProperties = class(TJavaGenericImport<JKeyPropertiesClass, JKeyProperties>) end;



implementation

end.
