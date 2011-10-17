Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1RFlPu-0000dQ-Cv
	for mharc-qemu-trivial@gnu.org; Mon, 17 Oct 2011 07:31:38 -0400
Received: from eggs.gnu.org ([140.186.70.92]:54957)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afaerber@suse.de>) id 1RFlPs-0000Wl-B6
	for qemu-trivial@nongnu.org; Mon, 17 Oct 2011 07:31:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <afaerber@suse.de>) id 1RFlPr-0004df-Bb
	for qemu-trivial@nongnu.org; Mon, 17 Oct 2011 07:31:36 -0400
Received: from cantor2.suse.de ([195.135.220.15]:40757 helo=mx2.suse.de)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afaerber@suse.de>)
	id 1RFlPf-0004Y8-Rl; Mon, 17 Oct 2011 07:31:23 -0400
Received: from [10.10.102.108] (charybdis-ext.suse.de [195.135.221.2])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx2.suse.de (Postfix) with ESMTP id C37B68AD27;
	Mon, 17 Oct 2011 13:31:22 +0200 (CEST)
Message-ID: <4E9C120A.7040508@suse.de>
Date: Mon, 17 Oct 2011 13:31:22 +0200
From: =?UTF-8?B?QW5kcmVhcyBGw6RyYmVy?= <afaerber@suse.de>
Organization: SUSE LINUX Products GmbH
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:7.0) Gecko/20110922 Thunderbird/7.0
MIME-Version: 1.0
To: Peter Maydell <peter.maydell@linaro.org>
References: <CAKUHwZqQa8BQGWEKgysuJmP2mHv-nS6k9+gNb6w3TsSNWSc_GQ@mail.gmail.com>
	<4E9C096B.9060405@suse.de>
	<CAFEAcA_6gLx3sD5r0cperWBbjYDTgmn5V-7dkUj-8g+PFEZP5Q@mail.gmail.com>
In-Reply-To: <CAFEAcA_6gLx3sD5r0cperWBbjYDTgmn5V-7dkUj-8g+PFEZP5Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4-2.6
X-Received-From: 195.135.220.15
Cc: qemu-trivial@nongnu.org, Dmitry Koshelev <karaghiozis@gmail.com>,
	qemu-devel@nongnu.org, paul@codesourcery.com
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] arm gic saving/loading fix
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
X-List-Received-Date: Mon, 17 Oct 2011 11:31:37 -0000

Am 17.10.2011 13:17, schrieb Peter Maydell:
> On 17 October 2011 11:54, Andreas F=C3=A4rber <afaerber@suse.de> wrote:
>> Am 17.10.2011 12:48, schrieb Dmitry Koshelev:
>>> irq_target field saving/loading is in the wrong loop
>>>
>>> Signed-off-by: Dmitry Koshelev <karagiozis@gmail.com>
>>
>> Reviewed-by: Andreas F=C3=A4rber <afaerber@suse.de>
>=20
> Doesn't it need a vmstate version bump too?

Sorry, you're right. Still reading my way into savevm code. arm_gic fix
is correct but due to GIC_NIRQ vs. NUM_CPU(), no reordering of the code
can really avoid a version bump here.

Andreas

--=20
SUSE LINUX Products GmbH, Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
GF: Jeff Hawn, Jennifer Guild, Felix Imend=C3=B6rffer; HRB 16746, AG N=C3=
=BCrnberg

