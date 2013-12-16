Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VsLj8-0000dV-Te
	for mharc-qemu-trivial@gnu.org; Sun, 15 Dec 2013 19:08:02 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60950)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.crosthwaite@petalogix.com>) id 1VsLj2-0000Vp-Vw
	for qemu-trivial@nongnu.org; Sun, 15 Dec 2013 19:08:00 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.crosthwaite@petalogix.com>) id 1VsLiq-0003jh-GX
	for qemu-trivial@nongnu.org; Sun, 15 Dec 2013 19:07:56 -0500
Received: from mail-wg0-f49.google.com ([74.125.82.49]:39419)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.crosthwaite@petalogix.com>) id 1VsLiq-0003g9-9R
	for qemu-trivial@nongnu.org; Sun, 15 Dec 2013 19:07:44 -0500
Received: by mail-wg0-f49.google.com with SMTP id x12so4012526wgg.16
	for <qemu-trivial@nongnu.org>; Sun, 15 Dec 2013 16:07:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	bh=AeoXKwGhJ5HYspg1FlDCt6XuCwymmN/l/zODhEAIXbs=;
	b=R6ZERVpTmG3YaWNYt86jfdNWt27DFiNaDz8B1p5TqzgkrfubH4eT8ClpGsrmi5oa9U
	xs/14w2ikDXFUTrZhaNdqvvfp3PoE6MfDToAuih+3EqC9sFBW/8Yea4+lBURoVl2n2L6
	HxWqgtwYKKLnv9eOwz3Nwi7TlV03xZQNwiKrVzE1wqa4eUipdfFX6Nzsp3RVh9sX8a4s
	e8YjTYrYB3nAYxa1KoQQUJTQSGhrJq355XYSqWneIA5DInB1Km82C5lD09WAQnhVXSTK
	No9Jyj72Vqzwuov1t6YbKirr926Rmgol0OFxVZgiBxqizDNb2BD2v88YZUknOYQbXUX5
	SqYA==
X-Gm-Message-State: ALoCoQnXl14gdz+yX01Ih1ltreqEtsYUkntKNEJ0fBmJSHkjunK5bRRplHec1wKT83TY7bYRTmBU
MIME-Version: 1.0
X-Received: by 10.180.189.49 with SMTP id gf17mr11303416wic.23.1387152462716; 
	Sun, 15 Dec 2013 16:07:42 -0800 (PST)
Sender: peter.crosthwaite@petalogix.com
Received: by 10.227.13.9 with HTTP; Sun, 15 Dec 2013 16:07:42 -0800 (PST)
In-Reply-To: <871u1dlxuc.fsf@moxielogic.com>
References: <1368475464-3116-1-git-send-email-green@moxielogic.com>
	<8761qqn496.fsf@moxielogic.com> <52ADFA17.2000109@suse.de>
	<CAFEAcA91BoCgAR5ahoFWWWEOzWjwzW0vmv2Ei9NprUwR6T4VKg@mail.gmail.com>
	<871u1dlxuc.fsf@moxielogic.com>
Date: Mon, 16 Dec 2013 10:07:42 +1000
X-Google-Sender-Auth: FSaWgvUKTdQO5BjWDK7J2qHutYI
Message-ID: <CAEgOgz5pZxkX4WUn24OVHvpMdtD0_xUgv7Nd2N_c3R_yPfp9Ug@mail.gmail.com>
From: Peter Crosthwaite <peter.crosthwaite@xilinx.com>
To: Anthony Green <green@moxielogic.com>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 74.125.82.49
Cc: Peter Maydell <peter.maydell@linaro.org>,
	QEMU Trivial <qemu-trivial@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>, Max Filippov <jcmvbkbc@gmail.com>,
	Anthony Liguori <aliguori@amazon.com>,
	=?ISO-8859-1?Q?Andreas_F=E4rber?= <afaerber@suse.de>,
	Richard Henderson <rth@twiddle.net>
Subject: Re: [Qemu-trivial] [Qemu-devel] ping.. Re: [PATCH moxie] Fix bug in
	tlb_fill.
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
X-List-Received-Date: Mon, 16 Dec 2013 00:08:01 -0000

On Mon, Dec 16, 2013 at 5:26 AM, Anthony Green <green@moxielogic.com> wrote=
:
> Peter Maydell <peter.maydell@linaro.org> writes:
>
>> On 15 December 2013 18:51, Andreas F=E4rber <afaerber@suse.de> wrote:
>>> And since this is purely in target-moxie I would suggest to simply send
>>> a pull as target maintainer once you have someone trustworthy's
>>> Reviewed-by and it doesn't break `make check`, similar to how it's done
>>> for OpenRISC.
>>
>> Yes, this makes sense to me, especially since Anthony has a number
>> of other moxie patches on list at this point.
>
> According to this page...
>
> http://wiki.qemu.org/Contribute/SubmitAPullRequest
>
> ...I need to get a key signed by a member of the QEMU community in
> person.  Are there any QEMU hackers in the Toronto area?
>

While this question has air, anyone in and around Brisbane Australia who
can sign me? (although that's probably a long shot).

I can get a key signed by Edgar if that is enough.

Regards,
Peter

> AG
>

