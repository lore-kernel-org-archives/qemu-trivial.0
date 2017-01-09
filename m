Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1cQaJ6-0001i1-IA
	for mharc-qemu-trivial@gnu.org; Mon, 09 Jan 2017 08:48:16 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34374)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1cQaJ3-0001fW-Pj
	for qemu-trivial@nongnu.org; Mon, 09 Jan 2017 08:48:15 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1cQaJ2-0004FH-Lf
	for qemu-trivial@nongnu.org; Mon, 09 Jan 2017 08:48:13 -0500
Received: from mail-wj0-x244.google.com ([2a00:1450:400c:c01::244]:33604)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <paolo.bonzini@gmail.com>)
	id 1cQaIw-0004Dv-4j; Mon, 09 Jan 2017 08:48:06 -0500
Received: by mail-wj0-x244.google.com with SMTP id kp2so84668586wjc.0;
	Mon, 09 Jan 2017 05:48:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding;
	bh=mVpo2pB4JxFhmhdp7JnjnagsyOD1j96bDRxu2WruUGA=;
	b=biyJ/CCl8Gonngl2thYMOuPRsAZAR5tnSWVqevb8tu5Qj7A4wtfF6dZb2bDoN90cld
	LdIIDlOGVKfXa9zOo2J+kLMpCWa9SyvrPoSffz3B6EIN+Et0kYZ8J47XcRWGYgRPf+1A
	haeyH6xDiPx6cgieZYQK7Bna59a2FyB6HAAIxh60oM3WleYkG0h+iTutsQgk6o9Qn3/7
	MTgJJOLIASO5qSw3jFaLlSi5lJekvmxHZaZbakuveur17n3FQrFLuaFX1OLq3NOlS227
	Ew60ZdT0l+e8L9NniRuC6FZIMF7Vk7VI/hq7DMkKhXIbylwwdA0zcxBjH17gx2IBEypx
	CfUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:references:cc:from:message-id
	:date:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=mVpo2pB4JxFhmhdp7JnjnagsyOD1j96bDRxu2WruUGA=;
	b=RkNBm2Z1oGu6NBnjHpUuXVjgI/Vn9Ora5gao87rQFxVE02WhYpB4Xmk6Bobh0elZnq
	iAVChhb9ZBIZGn+6uUPCpw8xLD+5J2SalNFpqvKlsl2pQGlaRBYAL8Hf3/auK5/mY9BY
	C5QeN/gAKStZETFtqxXZJEVtbC0ir8fCe9jJL0zbXUtRuZ/P4UW5bbT8S7sxv8ST9NOF
	heYkA/p+y37HEeRNAdrJWXNxR8WYluiDUi9nWSdhT+sxrEMJz1OL/7YjrUn62bzVcbXW
	018sHa7QcpK362xgxNhlVaJLwUyX17w/DKITXbvkbqt1HDayzXJoJ6mLdTOzquI2PqUv
	sgYA==
X-Gm-Message-State: AIkVDXJPKdBDRlgjBLcUlfV0MW0sDyyb6GY6AWA8pHi3CYmM9tkd3VpolBO3PlwyexYu2A==
X-Received: by 10.194.122.202 with SMTP id lu10mr14705951wjb.2.1483969684718; 
	Mon, 09 Jan 2017 05:48:04 -0800 (PST)
Received: from [192.168.10.165] (94-39-158-71.adsl-ull.clienti.tiscali.it.
	[94.39.158.71]) by smtp.googlemail.com with ESMTPSA id
	b15sm19016587wma.5.2017.01.09.05.48.03
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 09 Jan 2017 05:48:04 -0800 (PST)
Sender: Paolo Bonzini <paolo.bonzini@gmail.com>
To: Markus Armbruster <armbru@redhat.com>,
	=?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>
References: <1483194856-14079-1-git-send-email-hpoussin@reactos.org>
	<8737gsl7o7.fsf@dusky.pond.sub.org>
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
	qemu-devel@nongnu.org, Laurent Vivier <laurent@vivier.eu>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <4b140d8b-0745-6d7f-101f-25c3ca5f28c2@redhat.com>
Date: Mon, 9 Jan 2017 14:48:03 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.5.1
MIME-Version: 1.0
In-Reply-To: <8737gsl7o7.fsf@dusky.pond.sub.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:400c:c01::244
Subject: Re: [Qemu-trivial] [PATCH] vl: disable default cdrom when using
 explicitely scsi-hd
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
X-List-Received-Date: Mon, 09 Jan 2017 13:48:15 -0000



On 09/01/2017 13:49, Markus Armbruster wrote:
> Hervé Poussineau <hpoussin@reactos.org> writes:
> 
>> 'ide-hd', 'ide-cd' and 'scsi-cd' devices already disable default cdrom.
>> Make it the same for 'scsi-hd'.
>>
>> That way, we can add/replace the device on lun=2 without using -nodefaults.
> 
> Yes, but it might upset existing usage that relies on the default
> CD-ROM.  In my opinion, making your needs explicit is better than
> relying on defaults, but that doesn't mean we can change the defaults
> unthinkingly.  Definitely not qemu-trivial.
> 
> Opinions on the change?

The original rationale for the change was "ide-hd has to suppress the
default CD-ROM, or else you can't put one on secondary master without
-nodefaults" but the same applies for scsi-hd vs. lun=1.

So I'm not sure, but I lean towards accepting the patch.

Paolo

>> Signed-off-by: Hervé Poussineau <hpoussin@reactos.org>
>> ---
>>  vl.c | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/vl.c b/vl.c
>> index d77dd86..da97fe2 100644
>> --- a/vl.c
>> +++ b/vl.c
>> @@ -223,6 +223,7 @@ static struct {
>>      { .driver = "ide-hd",               .flag = &default_cdrom     },
>>      { .driver = "ide-drive",            .flag = &default_cdrom     },
>>      { .driver = "scsi-cd",              .flag = &default_cdrom     },
>> +    { .driver = "scsi-hd",              .flag = &default_cdrom     },
>>      { .driver = "virtio-serial-pci",    .flag = &default_virtcon   },
>>      { .driver = "virtio-serial",        .flag = &default_virtcon   },
>>      { .driver = "VGA",                  .flag = &default_vga       },
> 
> 

