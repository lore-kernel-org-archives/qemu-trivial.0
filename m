Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dazjo-00033i-IT
	for mharc-qemu-trivial@gnu.org; Fri, 28 Jul 2017 03:31:08 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53025)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dmitry@daynix.com>) id 1dazjm-00032E-I9
	for qemu-trivial@nongnu.org; Fri, 28 Jul 2017 03:31:07 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <dmitry@daynix.com>) id 1dazji-0005cJ-9s
	for qemu-trivial@nongnu.org; Fri, 28 Jul 2017 03:31:06 -0400
Received: from mail-wm0-x242.google.com ([2a00:1450:400c:c09::242]:35629)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <dmitry@daynix.com>) id 1dazji-0005bS-1r
	for qemu-trivial@nongnu.org; Fri, 28 Jul 2017 03:31:02 -0400
Received: by mail-wm0-x242.google.com with SMTP id r77so13228393wmd.2
	for <qemu-trivial@nongnu.org>; Fri, 28 Jul 2017 00:31:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=daynix-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=iNNTCkXdb0tGgOJ9/n0n4aVWEO53Wu2uvMr3+e/i4dU=;
	b=OT9N4lyYDLTxFHLQe2YL9segh4SJI0+d0PdLCdsHXNIu/w/nT2+Q28WMylQP7eTwte
	5MQt5XtrjDBvR8Ln6wV17uMCPVxoSkf2ZkNnY2l1kY2rrhsUqReTPdNJugR+UQudybdY
	plZvsvNg+ySm34d68EsFJhNjoP2dMtdBM7z2Kcwh479a87zk0iDM346V5Vqx+kFj4+jH
	0Z58EdHycC2tPODrHioixrE9qOY/md95nCvH6Py4X761F44x3F9a7buBU6sBV0d8XSSf
	mjj0sN6w9MfM7W4ISe2MTIPedO2NjWvKwMcbheQ+dQwW5efL5TnZ05yhbrq5MieBWllB
	pwXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=iNNTCkXdb0tGgOJ9/n0n4aVWEO53Wu2uvMr3+e/i4dU=;
	b=RkDDK8H9C6RNejh+lyGxhw0JM/IKrWCLPybYRSMwT7TbmmJvkURElAa9tvY8SqdTcD
	k6ODZkmJbyqNjXEnQc66JYmgnDjH3gzeOV8wf7kTolPcBTduauodYy+b5i+2z4ZP+8Kl
	G+YaMRg46jRTzFfXxH1XR9svYyoeJNwiUT6i8TSvRIVjLUstVFVSlAn/IVNLIRwIENH2
	9CzybLm2usbc3FWKR5z6+Qhs6BiLNDHtHICCbQv58m0BzuHjmhmu733z0qCM7a3NdeN8
	+bkQkSnYO8qWdV/UbLUBxeskiuo2PAVJT/aIBpdk2BCMseoHFL8OGDk/8djvS3CnQZNv
	/fkA==
X-Gm-Message-State: AIVw112v/2RR999yskD0xehs3KLSLRpvh0eEEkE6qZ9uN+puwrOD9ZFT
	8Z1kEaD8vHLmXJSE
X-Received: by 10.28.54.67 with SMTP id d64mr5029056wma.135.1501227060946;
	Fri, 28 Jul 2017 00:31:00 -0700 (PDT)
Received: from [192.168.1.151] ([141.226.172.156])
	by smtp.gmail.com with ESMTPSA id
	l29sm8867432wre.46.2017.07.28.00.30.59
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 28 Jul 2017 00:31:00 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (1.0)
From: Dmitry Fleytman <dmitry@daynix.com>
X-Mailer: iPhone Mail (14G60)
In-Reply-To: <a4a9c830-1047-c0f1-918d-d1543c881cd6@redhat.com>
Date: Fri, 28 Jul 2017 10:30:58 +0300
Cc: =?utf-8?Q?Philippe_Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <86F48478-C3BA-4002-BE6E-7448BB49826F@daynix.com>
References: <20170728053610.15770-1-f4bug@amsat.org>
	<20170728053610.15770-16-f4bug@amsat.org>
	<a4a9c830-1047-c0f1-918d-d1543c881cd6@redhat.com>
To: Thomas Huth <thuth@redhat.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c09::242
Subject: Re: [Qemu-trivial] [Qemu-devel] [RFC PATCH 15/47] MAINTAINERS: add
 missing VMWare entry
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial/>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Fri, 28 Jul 2017 07:31:07 -0000



> On 28 Jul 2017, at 10:08, Thomas Huth <thuth@redhat.com> wrote:
>=20
>> On 28.07.2017 07:35, Philippe Mathieu-Daud=C3=A9 wrote:
>> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
>> ---
>>=20
>> RFC because I'm not sure about tests/
>=20
> I think that should be fine, we've got a couple of such entries already
> in the MAINTAINERS file.
>=20
>> MAINTAINERS | 1 +
>> 1 file changed, 1 insertion(+)
>>=20
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index d8aef164ca..9670a3901a 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -1140,6 +1140,7 @@ M: Dmitry Fleytman <dmitry@daynix.com>
>> S: Maintained
>> F: hw/net/vmxnet*
>> F: hw/scsi/vmw_pvscsi*
>> +F: tests/vmxnet3-test.c
>>=20
>=20
> Reviewed-by: Thomas Huth <thuth@redhat.com>

Reviewed-by: Dmitry Fleytman <dmitry@daynix.com>


