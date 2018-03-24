Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ezjf8-0004Ei-Gz
	for mharc-qemu-trivial@gnu.org; Sat, 24 Mar 2018 09:56:50 -0400
Received: from eggs.gnu.org ([208.118.235.92]:50780)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <marcandre.lureau@gmail.com>) id 1ezjb7-0003XW-FE
	for qemu-trivial@nongnu.org; Sat, 24 Mar 2018 09:56:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <marcandre.lureau@gmail.com>) id 1ezjSf-00020u-MQ
	for qemu-trivial@nongnu.org; Sat, 24 Mar 2018 09:47:41 -0400
Received: from mail-wm0-x244.google.com ([2a00:1450:400c:c09::244]:36547)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <marcandre.lureau@gmail.com>)
	id 1ezjNp-0000BW-ET; Sat, 24 Mar 2018 09:38:57 -0400
Received: by mail-wm0-x244.google.com with SMTP id x82so8030227wmg.1;
	Sat, 24 Mar 2018 06:38:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=hfW35/dwPmOWKpCEjnAbfd0UJvYU5owL+Jg6iju3SGk=;
	b=ACIa4/li3xe8Adgv4iIFQuQDWJfoPkgiBnMMVXDYGtaKB6T+LT2lWSP/HNf5abxYic
	iWBpnWYZBcHaa5gXKMffMLooaWZjfnTsdRmTQXuP+3++TPMfs+KmoZQjAvs06giOWFsJ
	Mae0Xg1Kdn4YTdeuSBd67v1glqR53nfqnpotB3OFUy0NVwMGOnUNv7ZyO+FB6N7Outiz
	4Ngz7ME8shc6RP+5cBz/T9Erh95PykldHg65MqEjAn9oQBB9q2zB82tACtKehF+6gXWc
	FihsPxm4UGDErQbnqCZz/DNP08ttpEoV82M+In7LTPgLfDKVuPy3HLueObwbOHfEuw13
	JcwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=hfW35/dwPmOWKpCEjnAbfd0UJvYU5owL+Jg6iju3SGk=;
	b=Pb9ho+4SLdm9/wQvGH43418JelzNEI5Hn5QG6bMYXUXyztMx/bHMCqtEf1l30R/yNi
	grVR7OCGR8TxbRF8vxV9RdCJL1qeueU7+iB9XYmUmU/5kTHIDp3/7QGmC2k1HmINvkqd
	Wy88bF4aH9i9GwF+lI+MH/iZ0gQgt0TWwqCjSqe94vInDve1/NqEpm49HdmnhQRHrtsj
	WVIWPMdFIOrcTqEYn05d68nS1YXL0duK30kgAvOVc2+lh7lGaaevdig8WU+PNsSR3Sij
	lez4sJkH3i0tSu90nKpK+NESaWbg+PykHIMQbggcmQ1jhu0uBVnOkNL9lKcFVJp2pimv
	Agjw==
X-Gm-Message-State: AElRT7F3A8dGSALcNRWNTRCTVxsZJNTWkq2wdA4sdjzcVvPGOa0XFOgQ
	dT+CZjELOEo7A4r2bzJ4uzrnox1pKmIrIDKyozA=
X-Google-Smtp-Source: AG47ELsOSQdCIZjD4AE6H4PB3d/kHi/s/OeszSGGzAJpDIqzLXTHMF6AAHbvozwFL3IuPSf1MBJVm75bZWFLec31xig=
X-Received: by 10.28.133.193 with SMTP id h184mr7487937wmd.36.1521898736276;
	Sat, 24 Mar 2018 06:38:56 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.128.226 with HTTP; Sat, 24 Mar 2018 06:38:55 -0700 (PDT)
In-Reply-To: <82d1bda3-36a9-e5b9-1aa0-8319750c57f7@redhat.com>
References: <4e8dcc24123a09587ecc427f2e80727ba41a7866.1521868380.git.mprivozn@redhat.com>
	<CAJ+F1CJgXUY888Bo-SQ2yiDWeKk0NKe06bdzkZFL7A-6B4FusQ@mail.gmail.com>
	<82d1bda3-36a9-e5b9-1aa0-8319750c57f7@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Sat, 24 Mar 2018 14:38:55 +0100
Message-ID: <CAJ+F1CL4gBhh_qGc0ZV7bE__UvZaeLwFEyV--dHth6iX2HK1vg@mail.gmail.com>
To: Michal Privoznik <mprivozn@redhat.com>
Cc: QEMU <qemu-devel@nongnu.org>, qemu trival <qemu-trivial@nongnu.org>, 
	Gerd Hoffmann <kraxel@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c09::244
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] ccid-card: include
 libcacard.h only
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
X-List-Received-Date: Sat, 24 Mar 2018 13:56:48 -0000

Hi

On Sat, Mar 24, 2018 at 1:40 PM, Michal Privoznik <mprivozn@redhat.com> wro=
te:
> On 03/24/2018 12:01 PM, Marc-Andr=C3=A9 Lureau wrote:
>> Hi
>>
>> On Sat, Mar 24, 2018 at 6:13 AM, Michal Privoznik <mprivozn@redhat.com> =
wrote:
>>> When trying to build with latest libcacard-2.5.1, I hit the
>>> following error:
>>>
>>> In file included from hw/usb/ccid-card-passthru.c:12:0:
>>> /usr/include/cacard/vscard_common.h:26:2: error: #warning "Only <libcac=
ard.h> can be included directly" [-Werror=3Dcpp]
>>>  #warning "Only <libcacard.h> can be included directly"
>>>
>>
>> The warning was promptly removed in 2.5.2:
>> https://cgit.freedesktop.org/spice/libcacard/commit/?id=3D998db1e88eb821=
9264476c022d1446f3cb4330e8
>
> Cool. But We can still include just top level header file instead of
> individual files, can't we?

Yes, if we bump libcacard version dependency. 2.5.1 (that added
top-level libcacard.h) is from 2015-11-24.



--=20
Marc-Andr=C3=A9 Lureau

