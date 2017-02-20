Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1cfu2j-0004C8-Ka
	for mharc-qemu-trivial@gnu.org; Mon, 20 Feb 2017 14:54:41 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54903)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jsnow@redhat.com>) id 1cfu2g-00049e-OK
	for qemu-trivial@nongnu.org; Mon, 20 Feb 2017 14:54:39 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <jsnow@redhat.com>) id 1cfu2g-0002Kd-1b
	for qemu-trivial@nongnu.org; Mon, 20 Feb 2017 14:54:38 -0500
Received: from mx1.redhat.com ([209.132.183.28]:43144)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <jsnow@redhat.com>)
	id 1cfu2Z-0002Jo-Se; Mon, 20 Feb 2017 14:54:32 -0500
Received: from smtp.corp.redhat.com (int-mx16.intmail.prod.int.phx2.redhat.com
	[10.5.11.28])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 1EF22C054C36;
	Mon, 20 Feb 2017 19:54:31 +0000 (UTC)
Received: from scv.usersys.redhat.com (dhcp-17-221.bos.redhat.com
	[10.18.17.221])
	by smtp.corp.redhat.com (Postfix) with ESMTP id F1C99749E1;
	Mon, 20 Feb 2017 19:54:29 +0000 (UTC)
To: Markus Armbruster <armbru@redhat.com>,
	=?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>
References: <1483194856-14079-1-git-send-email-hpoussin@reactos.org>
	<8737gsl7o7.fsf@dusky.pond.sub.org>
	<4b140d8b-0745-6d7f-101f-25c3ca5f28c2@redhat.com>
	<fd8fb30f-4e54-e119-0287-2459fd6c85ca@reactos.org>
	<87a89hvfpd.fsf@dusky.pond.sub.org>
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-trivial@nongnu.org,
	Michael Tokarev <mjt@tls.msk.ru>, qemu-devel@nongnu.org,
	Laurent Vivier <laurent@vivier.eu>, qemu-block@nongnu.org
From: John Snow <jsnow@redhat.com>
Message-ID: <75f7111c-d7b1-e2a1-449f-52c38ef2d07f@redhat.com>
Date: Mon, 20 Feb 2017 14:54:29 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.7.0
MIME-Version: 1.0
In-Reply-To: <87a89hvfpd.fsf@dusky.pond.sub.org>
Content-Type: text/plain; charset=utf-8
X-Scanned-By: MIMEDefang 2.74 on 10.5.11.28
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.32]);
	Mon, 20 Feb 2017 19:54:31 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] vl: disable default cdrom
 when using explicitely scsi-hd
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
X-List-Received-Date: Mon, 20 Feb 2017 19:54:39 -0000



On 02/19/2017 08:00 PM, Markus Armbruster wrote:
> Herv=C3=A9 Poussineau <hpoussin@reactos.org> writes:
>=20
>> Hi,
>>
>> Le 09/01/2017 =C3=A0 14:48, Paolo Bonzini a =C3=A9crit :
>>>
>>>
>>> On 09/01/2017 13:49, Markus Armbruster wrote:
>>>> Herv=C3=A9 Poussineau <hpoussin@reactos.org> writes:
>>>>
>>>>> 'ide-hd', 'ide-cd' and 'scsi-cd' devices already disable default cd=
rom.
>>>>> Make it the same for 'scsi-hd'.
>>>>>
>>>>> That way, we can add/replace the device on lun=3D2 without using -n=
odefaults.
>>>>
>>>> Yes, but it might upset existing usage that relies on the default
>>>> CD-ROM.  In my opinion, making your needs explicit is better than
>>>> relying on defaults, but that doesn't mean we can change the default=
s
>>>> unthinkingly.  Definitely not qemu-trivial.
>>>>
>>>> Opinions on the change?
>>>
>>> The original rationale for the change was "ide-hd has to suppress the
>>> default CD-ROM, or else you can't put one on secondary master without
>>> -nodefaults" but the same applies for scsi-hd vs. lun=3D1.
>>>
>>> So I'm not sure, but I lean towards accepting the patch.
>>>
>>> Paolo
>>
>> Paolo, Markus, so what is the conclusion?
>> Accepting the patch, or refusing it?
>=20
> Suggest to repost with the commit message updated to mention the
> backwards incompatibility, and why you think it's okay.
> cc: John Snow <jsnow@redhat.com>, cc: qemu-block@nongnu.org
>=20

I don't have a lot of history with the SCSI devices, so I'd be pretty
much relying exclusively on a statement on what breaks with the change,
and why that breakage would be justified.

No strong feelings for/against right now and am likely to just defer to
Paolo, who was leaning towards accepting it.

--js

