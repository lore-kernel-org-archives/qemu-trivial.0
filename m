Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1SwEB9-0003xL-GD
	for mharc-qemu-trivial@gnu.org; Tue, 31 Jul 2012 11:16:11 -0400
Received: from eggs.gnu.org ([208.118.235.92]:56548)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <anthony@codemonkey.ws>) id 1SwEB2-0003da-6O
	for qemu-trivial@nongnu.org; Tue, 31 Jul 2012 11:16:09 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <anthony@codemonkey.ws>) id 1SwEAw-0002MA-2i
	for qemu-trivial@nongnu.org; Tue, 31 Jul 2012 11:16:04 -0400
Received: from mail-ob0-f173.google.com ([209.85.214.173]:65395)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <anthony@codemonkey.ws>) id 1SwEAv-0002K5-UH
	for qemu-trivial@nongnu.org; Tue, 31 Jul 2012 11:15:58 -0400
Received: by obbta14 with SMTP id ta14so10157903obb.4
	for <qemu-trivial@nongnu.org>; Tue, 31 Jul 2012 08:15:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:in-reply-to:references:user-agent:date
	:message-id:mime-version:content-type:content-transfer-encoding
	:x-gm-message-state;
	bh=HrSxLsVGtsLuqNmW+5FqZeA4BA+RARAyIZpLa9HOLEI=;
	b=OIeOdUZeMLE+4JP7V3SAAgXkoZ+Xj0SILTo2EXpq3KyRL8U5t4aPahKwIb2R5Oqjyy
	zddRo/Jwd8vAiGWFgOBI/QtHkyMCheb00Dly+njn3xrTvTMF9R1k5MP9Jp6I1ScbX9Oq
	0i7hOfe8qqlyCly/OPjG7a/oZTOYktxLyfHY43aBhOKmyV7CSCWbOs9RvAzA87bWVgtP
	CmeFxrym7OTycQl6i62DfkJ3qIZv/oynkk4dIMJyGOnbIxwf7oZjV5jRRjW+6ZSgdVQE
	VpvweDx/90Ds4E0CDHcniVhF4CyAdpMflom8IjhN37G/H6W4oMR1pxRR09j/nia+4OkB
	SNvA==
Received: by 10.182.110.37 with SMTP id hx5mr23720764obb.48.1343747757099;
	Tue, 31 Jul 2012 08:15:57 -0700 (PDT)
Received: from titi.smtp.gmail.com (cpe-70-123-145-39.austin.res.rr.com.
	[70.123.145.39])
	by mx.google.com with ESMTPS id fy6sm265779obc.7.2012.07.31.08.15.55
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 31 Jul 2012 08:15:56 -0700 (PDT)
From: Anthony Liguori <anthony@codemonkey.ws>
To: Andreas =?utf-8?Q?F=C3=A4rber?= <afaerber@suse.de>, Paolo Bonzini
	<pbonzini@redhat.com>
In-Reply-To: <5017F1E3.90806@suse.de>
References: <1343714097-545-1-git-send-email-sw@weilnetz.de>
	<5017EE1D.8060908@suse.de> <5017EEFD.5070503@redhat.com>
	<5017EFC6.1050705@suse.de> <5017F0A2.5030400@redhat.com>
	<5017F1E3.90806@suse.de>
User-Agent: Notmuch/0.13.2+93~ged93d79 (http://notmuchmail.org) Emacs/23.3.1
	(x86_64-pc-linux-gnu)
Date: Tue, 31 Jul 2012 10:15:54 -0500
Message-ID: <87y5m06jx1.fsf@codemonkey.ws>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Gm-Message-State: ALoCoQmj6j8/huDeQMvH9y6y5RpsxykWVjyySYFA1efg1uQZwR7Mp63QJus0CzejYd1y44UKXn8P
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.85.214.173
Cc: qemu-trivial@nongnu.org, Stefan Weil <sw@weilnetz.de>,
	Alexander Graf <agraf@suse.de>, qemu-devel@nongnu.org,
	Hannes Reinecke <hare@suse.de>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] megasas: Update function
	megasys_scsi_uninit
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
X-List-Received-Date: Tue, 31 Jul 2012 15:16:10 -0000

Andreas F=C3=A4rber <afaerber@suse.de> writes:

> Am 31.07.2012 16:50, schrieb Paolo Bonzini:
>> Il 31/07/2012 16:46, Andreas F=C3=A4rber ha scritto:
>>>>> Why would megasas be in master but not compiled/linked?
>>>> Because Anthony objected to how it picks the initiator WWN.
>>> Ah, anything keeping us from fixing that? :)
>>=20
>> Exact knowledge of the requirements, basically. :)
>
> I.e. waiting on feedback about numeric constraints from Hannes? :)
> Or waiting on general direction from Anthony?
> How to make progress there for 1.2 / Soft Freeze?

You cannot build guest visible state by casting pointers.

I'm really disappointed that this hasn't been resolved yet.  If it's not
resolved before the soft freeze, I think we ought to revert the megasas
patches completely.

Regards,

Anthony Liguori

>
> Andreas
>
> --=20
> SUSE LINUX Products GmbH, Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
> GF: Jeff Hawn, Jennifer Guild, Felix Imend=C3=B6rffer; HRB 16746 AG N=C3=
=BCrnberg

