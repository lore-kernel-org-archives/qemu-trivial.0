Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZSZmx-000668-AY
	for mharc-qemu-trivial@gnu.org; Thu, 20 Aug 2015 20:02:31 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44907)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <marcandre.lureau@gmail.com>) id 1ZSRHY-0000BF-35
	for qemu-trivial@nongnu.org; Thu, 20 Aug 2015 10:57:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <marcandre.lureau@gmail.com>) id 1ZSRHX-0005Nc-5U
	for qemu-trivial@nongnu.org; Thu, 20 Aug 2015 10:57:31 -0400
Received: from mail-ob0-x232.google.com ([2607:f8b0:4003:c01::232]:36486)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <marcandre.lureau@gmail.com>)
	id 1ZSRHT-0005Lb-Jh; Thu, 20 Aug 2015 10:57:27 -0400
Received: by obkg7 with SMTP id g7so34093136obk.3;
	Thu, 20 Aug 2015 07:57:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	bh=hzjYALkNwtwPstVCQzOCbv6bM2L/BWY4rfwPoX4qCDI=;
	b=g+Vjiab3NjcNYfddI6XvLytMUlMbjsFCh3U1gCe0rZNW/Z1LXl1ROJTHwoR+aeAdxx
	VLCajWdzIYlYDmKtFQyiOYqmBygqHRGjtwbKdOXWrYqub7lquGqS5SA0Te+af2mLKEFi
	mQKckUO9dRmpC9xsvS1Tt517lvdM6SRh3Xc2ry3VidcOgLbpMbpYn4ukdF36dDHTfsgy
	YmTcVvlP8vLsM3uWQX8ph+LW51stijKE54xuWIctXlPQPnIs5/fDGqAh6uX3q3tCGmUw
	S9CZoaCBim3ooHLsWVvVUcBxJRjHXI5StOeiO4jjRICnAaI7DDe/RIuD/sT9ajD9NnIv
	oNRA==
MIME-Version: 1.0
X-Received: by 10.182.28.67 with SMTP id z3mr3195600obg.69.1440082643567; Thu,
	20 Aug 2015 07:57:23 -0700 (PDT)
Received: by 10.76.76.164 with HTTP; Thu, 20 Aug 2015 07:57:23 -0700 (PDT)
In-Reply-To: <cff8241a8e30f0d39e0f50a435965cdd130cd5d5.1436279924.git.DirtY.iCE.hu@gmail.com>
References: <cff8241a8e30f0d39e0f50a435965cdd130cd5d5.1436279924.git.DirtY.iCE.hu@gmail.com>
Date: Thu, 20 Aug 2015 16:57:23 +0200
Message-ID: <CAJ+F1CJ_D+CRRLJyqaQic28-cf-u0wzp3OoGTUUMjadezhaxZA@mail.gmail.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
To: =?UTF-8?B?S8WRdsOhZ8OzLCBab2x0w6Fu?= <dirty.ice.hu@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2607:f8b0:4003:c01::232
Cc: qemu-trivial@nongnu.org, Kevin Wolf <kwolf@redhat.com>,
	QEMU <qemu-devel@nongnu.org>,
	"open list:Block layer core" <qemu-block@nongnu.org>,
	Markus Armbruster <armbru@redhat.com>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v3] opts: produce valid
	command line in qemu_opts_print
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
X-List-Received-Date: Fri, 21 Aug 2015 00:02:30 -0000

On Tue, Jul 7, 2015 at 4:42 PM, K=C5=91v=C3=A1g=C3=B3, Zolt=C3=A1n <dirty.i=
ce.hu@gmail.com> wrote:
> This will let us print options in a format that the user would actually
> write it on the command line (foo=3Dbar,baz=3Dasd,etc=3Ddef), without
> prepending a spurious comma at the beginning of the list, or quoting
> values unnecessarily.  This patch provides the following changes:
> * write and id=3D, if the option has an id

you can remove the first "and" here

> * do not print separator before the first element
> * do not quote string arguments
> * properly escape commas (,) for QEMU

Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>



--=20
Marc-Andr=C3=A9 Lureau

