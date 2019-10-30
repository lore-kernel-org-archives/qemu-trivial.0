Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iPnMY-0002US-DN
	for mharc-qemu-trivial@gnu.org; Wed, 30 Oct 2019 08:46:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33589)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <jordipujolp@gmail.com>) id 1iPipR-0005bv-8E
 for qemu-trivial@nongnu.org; Wed, 30 Oct 2019 03:55:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <jordipujolp@gmail.com>) id 1iPipN-0003Tf-VR
 for qemu-trivial@nongnu.org; Wed, 30 Oct 2019 03:55:39 -0400
Received: from mail-oi1-x22c.google.com ([2607:f8b0:4864:20::22c]:34637)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <jordipujolp@gmail.com>)
 id 1iPipN-0003Pm-NK
 for qemu-trivial@nongnu.org; Wed, 30 Oct 2019 03:55:37 -0400
Received: by mail-oi1-x22c.google.com with SMTP id l202so1200165oig.1
 for <qemu-trivial@nongnu.org>; Wed, 30 Oct 2019 00:55:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=AQu2cBReKW4uxbEXN/FuTmBZbrOjjMUsuh9yVXCzfxU=;
 b=ReHcfSHbAaWEwGg8q+gCg437RUMxnAvOekvsLh3ypR9BRc/lLqljnkop6mghg+v9Lf
 iXLtg2EP7PBEuHItBrOxG4za1txxjG+y81lLgDu1TgCPcJALeeWry42eGfP7/i4N9Pt3
 GrBKwPB1FXaxS/TqEkfQeNsrlDn8Tv0rsF/h3I35WISwoEZrqC5VFvlhrQPI+z279ZC0
 XyV5rKqKzU7vYMoP+R+7M5mE4fRDnYRlHkLEfrKwr+ldH3KfKhZYaV6MQCVrxP9rzmAV
 yTyFC2SyiQqqO66NQIkm+igZUFtHaCgZjsbjBPGR1zgn2mALAjW3Z93fG3VY74ImZsCD
 2flw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=AQu2cBReKW4uxbEXN/FuTmBZbrOjjMUsuh9yVXCzfxU=;
 b=W8CJzMOJPrMABAXbmxSenJ8kqYUwWWjgOQqzbGIGcJm4noI1cX/OJHR5ICfMILZc+j
 XRc/ZLSEH8G4f01zpVmxmCWRPTOyxM/+OGM3rEL7KL0Mc1tX9JTRT+XglfzyhUpYWL9d
 qka3ewXR4SH4c6QkkSitvtGMBeeoAwZpvlLH8Im5mvY9GuafDZD3bTG52C+DXhL47au8
 w2WtBZVHpTrW44UH/0L2XWADv+0Sd2DSc08IJW0WnuKi9vKZSq03sa4wMyUonw7svaCl
 xSJB97mFtAOlM6iWUMcTqn/KakEht4zLdMV96s6d97rUawN41d+wauUvDLoQ2qkdLrcQ
 3ZyA==
X-Gm-Message-State: APjAAAWrErc3vxLJrt+F/qulCIZdELA6djChTRRjv16KjKRPq9HMkMPS
 XJpLMOALFlKGn9KiNwL4UcvHEhMaVTSn6h5yZIuWLqV8
X-Google-Smtp-Source: APXvYqxJ6yvfQBV1TQ2iJt7UXh47e8yjtIFmEcc+qKuzinXPAChWZIr6VeAMohm2GCbkR/Blurq5iUvJXDmdZW0ZCvA=
X-Received: by 2002:a54:4116:: with SMTP id l22mr7796394oic.121.1572422136035; 
 Wed, 30 Oct 2019 00:55:36 -0700 (PDT)
MIME-Version: 1.0
From: Jordi Pujol <jordipujolp@gmail.com>
Date: Wed, 30 Oct 2019 08:55:24 +0100
Message-ID: <CACTE=gpFbUSxXeTwu6_tzSeoh_9Yp905aMdzCPCUz3h7kcgeyw@mail.gmail.com>
Subject: smb daemon get additional command line parameters from env variable
To: qemu-trivial@nongnu.org
Content-Type: multipart/mixed; boundary="000000000000db1e9605961c0eb2"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::22c
X-Mailman-Approved-At: Wed, 30 Oct 2019 08:46:09 -0400
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Wed, 30 Oct 2019 07:55:44 -0000

--000000000000db1e9605961c0eb2
Content-Type: text/plain; charset="UTF-8"

Hello,

The new version 4 of Samba disables version 1 SMB protocols, now to
run old Win clients we must modify the temporary configuration of the
samba daemon to enable protocols before starting the samba client.
This patch gets the value of the environment variable SMBDOPTIONS and
appends it to the smbd command line; it allows the user to specify
additional samba daemon parameters before starting qemu.
It also patches the fork_exec function in misc.c, to parse correctly
command lines that contain spaces.

Thanks,

Jordi Pujol

--000000000000db1e9605961c0eb2
Content-Type: text/x-patch; charset="US-ASCII"; name="smbd_options.patch"
Content-Disposition: attachment; filename="smbd_options.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_k2cza91b0>
X-Attachment-Id: f_k2cza91b0

RnJvbTogSm9yZGkgUHVqb2wgUGFsb21lciA8am9yZGlwdWpvbHBAZ21haWwuY29tPgpEYXRlOiBG
cmksIDI1IE9jdCAyMDE5IDA5OjI0OjE0ICswMjAwClN1YmplY3Q6IFtQQVRDSF0gUUVNVSBzYW1i
YSBkYWVtb246IGFkZGl0aW9uYWwgY29tbWFuZCBsaW5lIG9wdGlvbnMKClRoZSBzbWJkIGRhZW1v
biB0YWtlcyBhZGRpdGlvbmFsIGNvbW1hbmQgbGluZSBvcHRpb25zCmZyb20gZW52aXJvbm1lbnQg
dmFyaWFibGUgU01CRE9QVElPTlMuClNldCB0aGUgZW52aXJvbm1lbnQgdmFyaWFibGUgU01CRE9Q
VElPTlMgYmVmb3JlIGV4ZWN1dGluZyBxZW11LgoKRXhhbXBsZToKCmV4cG9ydCBTTUJET1BUSU9O
Uz0iLS1vcHRpb249J3NlcnZlciBtaW4gcHJvdG9jb2w9Q09SRScgLWQgNCIKLS0tCi0tLSBxZW11
LTQuMS1hL25ldC9zbGlycC5jCisrKyBxZW11XzQuMS1iL25ldC9zbGlycC5jCkBAIC05MDksNiAr
OTA5LDEyIEBAIHN0YXRpYyBpbnQgc2xpcnBfc21iKFNsaXJwU3RhdGUqIHMsIGNvbnMKICAgICAg
ICAgICAgICBDT05GSUdfU01CRF9DT01NQU5ELCBzLT5zbWJfZGlyLCBzbWJfY29uZik7CiAgICAg
Z19mcmVlKHNtYl9jb25mKTsKIAorICAgIGNoYXIgKm9wdGlvbnM7CisgICAgaWYgKChvcHRpb25z
ID0gZ19zdHJkdXAoZ19nZXRlbnYoIlNNQkRPUFRJT05TIikpKSAhPSBOVUxMKSB7CisgICAgICAg
IHNtYl9jbWRsaW5lID0gZ19zdHJkdXBfcHJpbnRmKCIlcyAlcyIsIHNtYl9jbWRsaW5lLCBvcHRp
b25zKTsKKyAgICB9CisgICAgZ19mcmVlKG9wdGlvbnMpOworCiAgICAgaWYgKHNsaXJwX2FkZF9l
eGVjKHMtPnNsaXJwLCBzbWJfY21kbGluZSwgJnZzZXJ2ZXJfYWRkciwgMTM5KSA8IDAgfHwKICAg
ICAgICAgc2xpcnBfYWRkX2V4ZWMocy0+c2xpcnAsIHNtYl9jbWRsaW5lLCAmdnNlcnZlcl9hZGRy
LCA0NDUpIDwgMCkgewogICAgICAgICBzbGlycF9zbWJfY2xlYW51cChzKTsKCi0tLSBxZW11LTQu
MS1hL3NsaXJwL3NyYy9taXNjLmMJMjAxOS0xMC0yOSAxNDo0MDoxNS4wNDMxMjA5NDEgKzAxMDAK
KysrIHFlbXUtNC4xLWIvc2xpcnAvc3JjL21pc2MuYwkyMDE5LTEwLTI5IDE0OjQxOjA0LjQ0MDIz
NTY4NCArMDEwMApAQCAtMTY4LDcgKzE2OCw5IEBAIGdfc3Bhd25fYXN5bmNfd2l0aF9mZHNfc2xp
cnAoY29uc3QgZ2NoYXIKIGludCBmb3JrX2V4ZWMoc3RydWN0IHNvY2tldCAqc28sIGNvbnN0IGNo
YXIgKmV4KQogewogICAgIEdFcnJvciAqZXJyID0gTlVMTDsKLSAgICBjaGFyICoqYXJndjsKKyAg
ICBnaW50IGFyZ2MgPSAwOworICAgIGdjaGFyICoqYXJndiA9IE5VTEw7CisgICAgZ2Jvb2xlYW4g
cmV0OwogICAgIGludCBvcHQsIHNwWzJdOwogCiAgICAgREVCVUdfQ0FMTCgiZm9ya19leGVjIik7
CkBAIC0xNzksNyArMTgxLDEzIEBAIGludCBmb3JrX2V4ZWMoc3RydWN0IHNvY2tldCAqc28sIGNv
bnN0IGMKICAgICAgICAgcmV0dXJuIDA7CiAgICAgfQogCi0gICAgYXJndiA9IGdfc3Ryc3BsaXQo
ZXgsICIgIiwgLTEpOworICAgIHJldCA9IGdfc2hlbGxfcGFyc2VfYXJndihleCwgJmFyZ2MsICZh
cmd2LCAmZXJyKTsKKyAgICBpZiAoZXJyKSB7CisgICAgICAgIGdfY3JpdGljYWwoImZvcmtfZXhl
YyBpbnZhbGlkIGNvbW1hbmQ6ICVzIiwgZXJyLT5tZXNzYWdlKTsKKyAgICAgICAgZ19lcnJvcl9m
cmVlKGVycik7CisgICAgICAgIHJldHVybiAwOworICAgIH0KKwogICAgIGdfc3Bhd25fYXN5bmNf
d2l0aF9mZHMoTlVMTCAvKiBjd2QgKi8sIGFyZ3YsIE5VTEwgLyogZW52ICovLAogICAgICAgICAg
ICAgICAgICAgICAgICAgICAgR19TUEFXTl9TRUFSQ0hfUEFUSCwgZm9ya19leGVjX2NoaWxkX3Nl
dHVwLAogICAgICAgICAgICAgICAgICAgICAgICAgICAgTlVMTCAvKiBkYXRhICovLCBOVUxMIC8q
IGNoaWxkX3BpZCAqLywgc3BbMV0sIHNwWzFdLAo=
--000000000000db1e9605961c0eb2--

