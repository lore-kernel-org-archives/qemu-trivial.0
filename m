Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1cfcLe-00021c-6e
	for mharc-qemu-trivial@gnu.org; Sun, 19 Feb 2017 20:01:02 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45743)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1cfcLc-00020O-5f
	for qemu-trivial@nongnu.org; Sun, 19 Feb 2017 20:01:01 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1cfcLb-00047I-Cu
	for qemu-trivial@nongnu.org; Sun, 19 Feb 2017 20:01:00 -0500
Received: from mx1.redhat.com ([209.132.183.28]:41820)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <armbru@redhat.com>)
	id 1cfcLU-00043W-7A; Sun, 19 Feb 2017 20:00:52 -0500
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 090C2C054C4B;
	Mon, 20 Feb 2017 01:00:51 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-116-55.ams2.redhat.com
	[10.36.116.55])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id v1K10lwc007534
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Sun, 19 Feb 2017 20:00:48 -0500
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id 340401138647; Mon, 20 Feb 2017 02:00:46 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: =?utf-8?Q?Herv=C3=A9?= Poussineau <hpoussin@reactos.org>
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-trivial@nongnu.org,
	Michael Tokarev <mjt@tls.msk.ru>, qemu-devel@nongnu.org,
	Laurent Vivier <laurent@vivier.eu>, John Snow <jsnow@redhat.com>,
	qemu-block@nongnu.org
References: <1483194856-14079-1-git-send-email-hpoussin@reactos.org>
	<8737gsl7o7.fsf@dusky.pond.sub.org>
	<4b140d8b-0745-6d7f-101f-25c3ca5f28c2@redhat.com>
	<fd8fb30f-4e54-e119-0287-2459fd6c85ca@reactos.org>
Date: Mon, 20 Feb 2017 02:00:46 +0100
In-Reply-To: <fd8fb30f-4e54-e119-0287-2459fd6c85ca@reactos.org>
	(=?utf-8?Q?=22Herv=C3=A9?=
	Poussineau"'s message of "Sat, 18 Feb 2017 18:58:10 +0100")
Message-ID: <87a89hvfpd.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/25.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.32]);
	Mon, 20 Feb 2017 01:00:51 +0000 (UTC)
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
X-List-Received-Date: Mon, 20 Feb 2017 01:01:01 -0000

Herv=C3=A9 Poussineau <hpoussin@reactos.org> writes:

> Hi,
>
> Le 09/01/2017 =C3=A0 14:48, Paolo Bonzini a =C3=A9crit :
>>
>>
>> On 09/01/2017 13:49, Markus Armbruster wrote:
>>> Herv=C3=A9 Poussineau <hpoussin@reactos.org> writes:
>>>
>>>> 'ide-hd', 'ide-cd' and 'scsi-cd' devices already disable default cdrom.
>>>> Make it the same for 'scsi-hd'.
>>>>
>>>> That way, we can add/replace the device on lun=3D2 without using -node=
faults.
>>>
>>> Yes, but it might upset existing usage that relies on the default
>>> CD-ROM.  In my opinion, making your needs explicit is better than
>>> relying on defaults, but that doesn't mean we can change the defaults
>>> unthinkingly.  Definitely not qemu-trivial.
>>>
>>> Opinions on the change?
>>
>> The original rationale for the change was "ide-hd has to suppress the
>> default CD-ROM, or else you can't put one on secondary master without
>> -nodefaults" but the same applies for scsi-hd vs. lun=3D1.
>>
>> So I'm not sure, but I lean towards accepting the patch.
>>
>> Paolo
>
> Paolo, Markus, so what is the conclusion?
> Accepting the patch, or refusing it?

Suggest to repost with the commit message updated to mention the
backwards incompatibility, and why you think it's okay.
cc: John Snow <jsnow@redhat.com>, cc: qemu-block@nongnu.org

