Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1RXdzo-00020J-CX
	for mharc-qemu-trivial@gnu.org; Mon, 05 Dec 2011 14:14:36 -0500
Received: from eggs.gnu.org ([140.186.70.92]:44578)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <cheffner@tacnetsol.com>) id 1RXdzl-00020C-RU
	for qemu-trivial@nongnu.org; Mon, 05 Dec 2011 14:14:34 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <cheffner@tacnetsol.com>) id 1RXdzj-0003Xn-HT
	for qemu-trivial@nongnu.org; Mon, 05 Dec 2011 14:14:33 -0500
Received: from mail-qw0-f52.google.com ([209.85.216.52]:47568)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <cheffner@tacnetsol.com>) id 1RXdzj-0003Xa-DR
	for qemu-trivial@nongnu.org; Mon, 05 Dec 2011 14:14:31 -0500
Received: by qan41 with SMTP id 41so3632671qan.4
	for <qemu-trivial@nongnu.org>; Mon, 05 Dec 2011 11:14:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tacnetsol.com; s=tns;
	h=from:content-type:subject:date:message-id:to:mime-version:x-mailer;
	bh=ZUOCCmheG3OPZ1/IsaVTTnTrXIsfzyfGcvVxSpvwrL0=;
	b=lUnmF6E5G/cjgAIOZwIvwJ/LA9FkiUqvbKlSrZRNscAQQ+zws3wm78V5hiK956O8yI
	htR+g7pMWic/snGHZfb9MBpW3AKgcJXVHVIrpLdtZAuKHEftIjCqG2lCjwcBIIZRma/z
	pJ9k4EGIq2eVlkdOpsfBswVRdqj1KprZH44Xg=
Received: by 10.224.17.209 with SMTP id t17mr9473190qaa.13.1323112469868;
	Mon, 05 Dec 2011 11:14:29 -0800 (PST)
Received: from new-host.tns (pool-96-244-144-225.bltmmd.fios.verizon.net.
	[96.244.144.225])
	by mx.google.com with ESMTPS id ed2sm27229716qab.15.2011.12.05.11.14.28
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 05 Dec 2011 11:14:29 -0800 (PST)
From: Craig <cheffner@tacnetsol.com>
Content-Type: multipart/signed; boundary=Apple-Mail-1--939599787;
	protocol="application/pkcs7-signature"; micalg=sha1
Date: Mon, 5 Dec 2011 14:14:27 -0500
Message-Id: <EE7FAED6-555F-4A0C-9131-15353A5650C6@tacnetsol.com>
To: qemu-trivial@nongnu.org
Mime-Version: 1.0 (Apple Message framework v1084)
X-Mailer: Apple Mail (2.1084)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 2)
X-Received-From: 209.85.216.52
Subject: [Qemu-trivial] User mode support for Linux ELF files with no
	section headers
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Mon, 05 Dec 2011 19:14:34 -0000


--Apple-Mail-1--939599787
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii

In user mode Linux, Qemu currently refuses to load ELF files that do not =
contain section headers (ehdr->e_shentsize =3D=3D 0). Since section =
headers are not required in order to load an ELF file, simply removing =
the e_shentsize check in elf_check_ehdr() allows ELF binaries with no =
section headers to be run properly in user mode:

Signed-off-by: Craig Heffner <cheffner@tacnetsol.com>
--- qemu/linux-user/elfload.c	2011-12-02 15:16:07.637541215 -0500
+++ qemu-patched/linux-user/elfload.c	2011-12-02 15:27:24.061522798 =
-0500
@@ -1068,7 +1068,6 @@ static bool elf_check_ehdr(struct elfhdr
     return (elf_check_arch(ehdr->e_machine)
             && ehdr->e_ehsize =3D=3D sizeof(struct elfhdr)
             && ehdr->e_phentsize =3D=3D sizeof(struct elf_phdr)
-            && ehdr->e_shentsize =3D=3D sizeof(struct elf_shdr)
             && (ehdr->e_type =3D=3D ET_EXEC || ehdr->e_type =3D=3D =
ET_DYN));
 }


--Apple-Mail-1--939599787
Content-Disposition: attachment;
	filename=smime.p7s
Content-Type: application/pkcs7-signature;
	name=smime.p7s
Content-Transfer-Encoding: base64

MIAGCSqGSIb3DQEHAqCAMIACAQExCzAJBgUrDgMCGgUAMIAGCSqGSIb3DQEHAQAAoIIKYDCCBN0w
ggPFoAMCAQICEHGS++YZX6xNEoV0cTSiGKcwDQYJKoZIhvcNAQEFBQAwezELMAkGA1UEBhMCR0Ix
GzAZBgNVBAgMEkdyZWF0ZXIgTWFuY2hlc3RlcjEQMA4GA1UEBwwHU2FsZm9yZDEaMBgGA1UECgwR
Q29tb2RvIENBIExpbWl0ZWQxITAfBgNVBAMMGEFBQSBDZXJ0aWZpY2F0ZSBTZXJ2aWNlczAeFw0w
NDAxMDEwMDAwMDBaFw0yODEyMzEyMzU5NTlaMIGuMQswCQYDVQQGEwJVUzELMAkGA1UECBMCVVQx
FzAVBgNVBAcTDlNhbHQgTGFrZSBDaXR5MR4wHAYDVQQKExVUaGUgVVNFUlRSVVNUIE5ldHdvcmsx
ITAfBgNVBAsTGGh0dHA6Ly93d3cudXNlcnRydXN0LmNvbTE2MDQGA1UEAxMtVVROLVVTRVJGaXJz
dC1DbGllbnQgQXV0aGVudGljYXRpb24gYW5kIEVtYWlsMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8A
MIIBCgKCAQEAsjmFpPJ9q0E7YkY3rs3BYHW8OWX5ShpHornMSMxqmNVNNRm5pELlzkniii8efNIx
B8dOtINknS4p1aJkxIW9hVE1eaROaJB7HHqkkqgX8pgV8pPMyaQylbsMTzC9mKALi+VuG6JG+ni8
om+rWV6lL8/K2m2qL+usobNqqrcuZzWLeeEeaYji5kbNoKXqvgvOdjp6Dpvq/NonWz1zHyLmSGHG
TPNpsaguG7bUMSAsvIKKjqQOpdeJQ/wWWq8dcdcRWdq6hw2v+vPhwvCkxWeM1tZUOt4KpLoDd7Nl
yP0e03RiqhjKaJMeoYV+9Udly/hNVyh00jT/MLbu9mIwFIws6wIDAQABo4IBJzCCASMwHwYDVR0j
BBgwFoAUoBEKIz6W8Qfs4q8p74Klf9AwpLQwHQYDVR0OBBYEFImCZ33EnSZwAEu0UEh83j2uBG59
MA4GA1UdDwEB/wQEAwIBBjAPBgNVHRMBAf8EBTADAQH/MB0GA1UdJQQWMBQGCCsGAQUFBwMCBggr
BgEFBQcDBDARBgNVHSAECjAIMAYGBFUdIAAwewYDVR0fBHQwcjA4oDagNIYyaHR0cDovL2NybC5j
b21vZG9jYS5jb20vQUFBQ2VydGlmaWNhdGVTZXJ2aWNlcy5jcmwwNqA0oDKGMGh0dHA6Ly9jcmwu
Y29tb2RvLm5ldC9BQUFDZXJ0aWZpY2F0ZVNlcnZpY2VzLmNybDARBglghkgBhvhCAQEEBAMCAQYw
DQYJKoZIhvcNAQEFBQADggEBAJ2Vyzy4fqUJxB6/C8LHdo45PJTGEKpPDMngq4RdiVTgZTvzbRx8
NywlVF+WIfw3hJGdFdwUT4HPVB1rbEVgxy35l1FM+WbKPKCCjKbI8OLp1Er57D9Wyd12jMOCAU9s
APMeGmF0BEcDqcZAV5G8ZSLFJ2dPV9tkWtmNH7qGL/QGrpxp7en0zykX2OBKnxogL5dMUbtGB8SK
N04g4wkxaMeexIud6H4RvDJoEJYRmETYKlFgTYjrdDrfQwYyyDlWjDoRUtNBpEMD9O3vMyfbOeAU
TibJ2PU54om4k123KSZB6rObroP8d3XK6Mq1/uJlSmM+RMTQw16Hc6mYHK9/FX8wggV7MIIEY6AD
AgECAhEAtAqoXOjtsUrPHTMBtYEHcjANBgkqhkiG9w0BAQUFADCBrjELMAkGA1UEBhMCVVMxCzAJ
BgNVBAgTAlVUMRcwFQYDVQQHEw5TYWx0IExha2UgQ2l0eTEeMBwGA1UEChMVVGhlIFVTRVJUUlVT
VCBOZXR3b3JrMSEwHwYDVQQLExhodHRwOi8vd3d3LnVzZXJ0cnVzdC5jb20xNjA0BgNVBAMTLVVU
Ti1VU0VSRmlyc3QtQ2xpZW50IEF1dGhlbnRpY2F0aW9uIGFuZCBFbWFpbDAeFw0xMTAxMTkwMDAw
MDBaFw0xMjAxMTkyMzU5NTlaMCcxJTAjBgkqhkiG9w0BCQEWFmNoZWZmbmVyQHRhY25ldHNvbC5j
b20wggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQDAC2ci+8UERO+XVUYdBaNQojcIv+6W
ynozEIPEOOmgwyMsPqNslp9xbf6ZGsOzJcO3V3/dUMSokzm2hzRgH8CtB4We/bMmB1qeHgbDiGci
G+n4HosBwyRi8mbaYr4FCYHqyX/ygEjD/qMY5WAT+9utMEZpWpk5XD3McG4DoI4Qi0s8sTpg3WLL
TCWRatSy88wKdUeqI8xyWvYXc8mkdodDk+2iqBwZY3tPC7+HUVtd7XFeqV3g0EFMsEatGhBzJsc0
cU69ltmMwoLRuutZ8+iUU2ulT3vvhQZOFtblTkic4dlTbge3RTsSxS5sYZZiUhDIdXkLe4bGpKSa
ZgLKobPJAgMBAAGjggIYMIICFDAfBgNVHSMEGDAWgBSJgmd9xJ0mcABLtFBIfN49rgRufTAdBgNV
HQ4EFgQU1se6tfdE0P65WJzldOtfR/7Wx70wDgYDVR0PAQH/BAQDAgWgMAwGA1UdEwEB/wQCMAAw
IAYDVR0lBBkwFwYIKwYBBQUHAwQGCysGAQQBsjEBAwUCMBEGCWCGSAGG+EIBAQQEAwIFIDBGBgNV
HSAEPzA9MDsGDCsGAQQBsjEBAgEBATArMCkGCCsGAQUFBwIBFh1odHRwczovL3NlY3VyZS5jb21v
ZG8ubmV0L0NQUzCBpQYDVR0fBIGdMIGaMEygSqBIhkZodHRwOi8vY3JsLmNvbW9kb2NhLmNvbS9V
VE4tVVNFUkZpcnN0LUNsaWVudEF1dGhlbnRpY2F0aW9uYW5kRW1haWwuY3JsMEqgSKBGhkRodHRw
Oi8vY3JsLmNvbW9kby5uZXQvVVROLVVTRVJGaXJzdC1DbGllbnRBdXRoZW50aWNhdGlvbmFuZEVt
YWlsLmNybDBsBggrBgEFBQcBAQRgMF4wNgYIKwYBBQUHMAKGKmh0dHA6Ly9jcnQuY29tb2RvY2Eu
Y29tL1VUTkFBQUNsaWVudENBLmNydDAkBggrBgEFBQcwAYYYaHR0cDovL29jc3AuY29tb2RvY2Eu
Y29tMCEGA1UdEQQaMBiBFmNoZWZmbmVyQHRhY25ldHNvbC5jb20wDQYJKoZIhvcNAQEFBQADggEB
ADqYetfCPGbMbcQbGLAjQVnrOLAKbuWK8P0p77NLaUL7Zj9cIWKVq9IT6xQhOKEbKXyAnzJzaXTq
3gK7JetZPAoRF+ZdVZUBSqJlAHKoYF9TVns1PeTQyGEvNXgmxu4zGkzZbYJLj7VPyeHZbtlAOXO0
MVTRZCTHyhN6DV1/t3Qcyl/Yg3GVGIWfP8EmieK7glsAtgTLZs8OHPO2bBLiq7S9zBOL7HFa1AJ1
36Hj9TeA6LimaBsADxP6qZy+aGubxHDiCe4BQcIAcEroUlH8uCSejZjddJlydtqMYUbWV6YyvSA9
qpWDZuGLcm6rpGPx7LTHvxWcDGu1RLu3moy2NpUxggP/MIID+wIBATCBxDCBrjELMAkGA1UEBhMC
VVMxCzAJBgNVBAgTAlVUMRcwFQYDVQQHEw5TYWx0IExha2UgQ2l0eTEeMBwGA1UEChMVVGhlIFVT
RVJUUlVTVCBOZXR3b3JrMSEwHwYDVQQLExhodHRwOi8vd3d3LnVzZXJ0cnVzdC5jb20xNjA0BgNV
BAMTLVVUTi1VU0VSRmlyc3QtQ2xpZW50IEF1dGhlbnRpY2F0aW9uIGFuZCBFbWFpbAIRALQKqFzo
7bFKzx0zAbWBB3IwCQYFKw4DAhoFAKCCAg8wGAYJKoZIhvcNAQkDMQsGCSqGSIb3DQEHATAcBgkq
hkiG9w0BCQUxDxcNMTExMjA1MTkxNDI3WjAjBgkqhkiG9w0BCQQxFgQU/g/whwh0WWPVxutcFkyS
kSlYb10wgdUGCSsGAQQBgjcQBDGBxzCBxDCBrjELMAkGA1UEBhMCVVMxCzAJBgNVBAgTAlVUMRcw
FQYDVQQHEw5TYWx0IExha2UgQ2l0eTEeMBwGA1UEChMVVGhlIFVTRVJUUlVTVCBOZXR3b3JrMSEw
HwYDVQQLExhodHRwOi8vd3d3LnVzZXJ0cnVzdC5jb20xNjA0BgNVBAMTLVVUTi1VU0VSRmlyc3Qt
Q2xpZW50IEF1dGhlbnRpY2F0aW9uIGFuZCBFbWFpbAIRALQKqFzo7bFKzx0zAbWBB3IwgdcGCyqG
SIb3DQEJEAILMYHHoIHEMIGuMQswCQYDVQQGEwJVUzELMAkGA1UECBMCVVQxFzAVBgNVBAcTDlNh
bHQgTGFrZSBDaXR5MR4wHAYDVQQKExVUaGUgVVNFUlRSVVNUIE5ldHdvcmsxITAfBgNVBAsTGGh0
dHA6Ly93d3cudXNlcnRydXN0LmNvbTE2MDQGA1UEAxMtVVROLVVTRVJGaXJzdC1DbGllbnQgQXV0
aGVudGljYXRpb24gYW5kIEVtYWlsAhEAtAqoXOjtsUrPHTMBtYEHcjANBgkqhkiG9w0BAQEFAASC
AQC266ztoBGGGIikQxCreeIRvTb+LEFAc3x70YBsosVPSB4T/cNNtj8lkfXoiSZpgSe4cf6wvF3F
3n1eTbnRf1APjoZOGT/kcIUGGDDdzd1meGGx0yC/w7TKvZpBJjizrEuo0UZMrHzU/XrhX5RTH1Ex
X7iljsBtVSn3/taEgWImzTKPULbl/4fL3trjNPL98SLO3xtsArjNLsnbVDTcShRl2p+lQs0rAI55
lcXCAXZW1sgkQUPgJYtlWyGVQWHkp1guknGNAQtuU98EndWSBcHb5iLC4xckWSEpFfRvDVEOCAAT
VKkLR7BjbvLOwVkUVZNpwQtrU6Bm3TvrLbHlVt1aAAAAAAAA

--Apple-Mail-1--939599787--

