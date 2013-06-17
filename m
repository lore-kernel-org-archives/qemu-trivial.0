Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UoTu6-00077D-OT
	for mharc-qemu-trivial@gnu.org; Mon, 17 Jun 2013 03:31:06 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49375)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.crosthwaite@petalogix.com>) id 1UoTu3-000739-R5
	for qemu-trivial@nongnu.org; Mon, 17 Jun 2013 03:31:05 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.crosthwaite@petalogix.com>) id 1UoTu2-0001CS-Iz
	for qemu-trivial@nongnu.org; Mon, 17 Jun 2013 03:31:03 -0400
Received: from mail-bk0-x231.google.com ([2a00:1450:4008:c01::231]:56034)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.crosthwaite@petalogix.com>) id 1UoTu2-0001CJ-DQ
	for qemu-trivial@nongnu.org; Mon, 17 Jun 2013 03:31:02 -0400
Received: by mail-bk0-f49.google.com with SMTP id mz10so996562bkb.8
	for <qemu-trivial@nongnu.org>; Mon, 17 Jun 2013 00:31:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding:x-gm-message-state;
	bh=nJfGHDFteIw+pMYv5k1CEyi/uEAOfpwqo8lvfkLH1e4=;
	b=dj9Jx5lqE2Oaf2vbykJlUyeWZ+FRXfIlYk5SF1TMV1yNCM6GRcfm+TeWiyK8t64dd0
	4BXhxKA5UhkPzrtt79MeAokcNhGOXYEQ5AOEcfcSHHgEP9IhJPaBcTtTM+tA605IxdOF
	E3Ab6jRkTBxxOwfU+z3h99WaRXDssbPBUgNOntbz7A0mqlNr5oPuPuan5rhUaD1nCbsh
	bryERrtZaTuanNcu0OSrq6qFHVVCsnV2YENb5FLx7PrGDUd69q0JjIcAqLFUWB9hWDnJ
	26JTwR6VVJn2Wvkw3rUOzUtX9zW2Nztq4cI+Ley+5ZtKOE6nJwABJbQiMjzbTmddi58J
	rEGw==
MIME-Version: 1.0
X-Received: by 10.204.55.201 with SMTP id v9mr1715821bkg.149.1371454261554;
	Mon, 17 Jun 2013 00:31:01 -0700 (PDT)
Sender: peter.crosthwaite@petalogix.com
Received: by 10.204.35.136 with HTTP; Mon, 17 Jun 2013 00:31:01 -0700 (PDT)
In-Reply-To: <51BEB7EA.9050300@suse.de>
References: <CAEgEybqrZ50JD5jmf9ge2g1VgNB5XE4wLkfxvB6qBe89vjP8Zw@mail.gmail.com>
	<51BE5EE8.5070607@suse.de> <51BEB4A7.4000806@redhat.com>
	<51BEB7EA.9050300@suse.de>
Date: Mon, 17 Jun 2013 17:31:01 +1000
X-Google-Sender-Auth: guLrBipqSyTU_N9aDm5Egac16IA
Message-ID: <CAEgOgz4xB0yegqs+px4iQJZ=2tkEB-BZC_2i21GBd91Tv5n1UA@mail.gmail.com>
From: Peter Crosthwaite <peter.crosthwaite@xilinx.com>
To: =?ISO-8859-1?Q?Andreas_F=E4rber?= <afaerber@suse.de>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
X-Gm-Message-State: ALoCoQm2CJVkxlGSc1Dw5jtC3CCMyHsqL9W4IfoY7WR/eSZBPXJ8Zp2+XvN7HqczAtHD/G0Q47p8
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a00:1450:4008:c01::231
Cc: Vladimir Senkov <hangup@gmail.com>, qemu-trivial <qemu-trivial@nongnu.org>,
	qemu-devel@nongnu.org, qemu-stable@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [Qemu-trivial] [Qemu-devel] copy&paste error in serial.c causes
 a crash when attempting to read from UART (if there is no data to be read)
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
X-List-Received-Date: Mon, 17 Jun 2013 07:31:05 -0000

On Mon, Jun 17, 2013 at 5:16 PM, Andreas F=E4rber <afaerber@suse.de> wrote:
> Am 17.06.2013 09:03, schrieb Paolo Bonzini:
>> Il 17/06/2013 02:57, Andreas F=E4rber ha scritto:
>>>>> From 032bdc94c6369aa7b578182cdad8038ebb2b8cd1 Mon Sep 17 00:00:00 200=
1
>>>>> From: Vladimir Senkov <hangup@gmail.com <mailto:hangup@gmail.com>>
>>>>> Date: Sun, 16 Jun 2013 20:30:52 -0400
>>>>> Subject: [PATCH] fixed a copy&paste error in serial.c
>>>>>
>>>>> Signed-off-by: Vladimir Senkov <hangup@gmail.com <mailto:hangup@gmail=
.com>>
>>> Patch is HTML-damaged unfortunately, we recommend git-send-email:
>>> http://wiki.qemu.org/Contribute/SubmitAPatch
>>>
>>> But since the patch is so trivial, maybe Peter or Michael can fix it up=
?
>>
>> And also add Cc: qemu-stable.
>
> I interpreted this as a regression through Peter's serial patches that
> went in via trivial pull last week, but I may well be wrong. :)
>

You are right. Regression introduced by me in serial cleanup series.

No need for stable as stable shouldn't have picked up that series.

Regards,
Peter

> Andreas
>
> --
> SUSE LINUX Products GmbH, Maxfeldstr. 5, 90409 N=FCrnberg, Germany
> GF: Jeff Hawn, Jennifer Guild, Felix Imend=F6rffer; HRB 16746 AG N=FCrnbe=
rg
>

