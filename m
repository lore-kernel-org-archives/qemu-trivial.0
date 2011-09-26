Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1R83Kt-0002OR-Um
	for mharc-qemu-trivial@gnu.org; Mon, 26 Sep 2011 01:02:35 -0400
Received: from eggs.gnu.org ([140.186.70.92]:49419)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <antonynpavlov@gmail.com>) id 1R83Kr-0002IX-DO
	for qemu-trivial@nongnu.org; Mon, 26 Sep 2011 01:02:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <antonynpavlov@gmail.com>) id 1R83Kq-00044r-EN
	for qemu-trivial@nongnu.org; Mon, 26 Sep 2011 01:02:33 -0400
Received: from mail-wy0-f173.google.com ([74.125.82.173]:55466)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <antonynpavlov@gmail.com>)
	id 1R83Ko-00044b-AH; Mon, 26 Sep 2011 01:02:30 -0400
Received: by wyh22 with SMTP id 22so6159764wyh.4
	for <multiple recipients>; Sun, 25 Sep 2011 22:02:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	bh=rOeP/ily2eEUwU/7wOEm4mxpKCaQzaXiGcmt2LJJqXI=;
	b=SAQW8N5nu3D9m30gG3ys5kVbzv1Zg6sWC7w08ExsrIZ0GXfEQksFQx/2NKVSId/ze0
	p2Qp4B4Koj3D7s5DEi/T9TEJ3iQTSKKLfMJd+v102Dev8Bhp9DfHmiaeD7z2JMToIEwB
	IFfPHtnmPMckdy5Rrn+5QtFH88u0f3eOTJPWU=
MIME-Version: 1.0
Received: by 10.216.179.205 with SMTP id h55mr8231435wem.51.1317013349217;
	Sun, 25 Sep 2011 22:02:29 -0700 (PDT)
Received: by 10.216.47.211 with HTTP; Sun, 25 Sep 2011 22:02:29 -0700 (PDT)
In-Reply-To: <CAFEAcA_dT-N0qWXqcF_7K1zZ5q3RbrXxF=oJYAvYx_YeFQgpwA@mail.gmail.com>
References: <1316980937-18588-1-git-send-email-antonynpavlov@gmail.com>
	<CAFEAcA_dT-N0qWXqcF_7K1zZ5q3RbrXxF=oJYAvYx_YeFQgpwA@mail.gmail.com>
Date: Mon, 26 Sep 2011 09:02:29 +0400
Message-ID: <CAA4bVAG-29fGBDcZyT1g8sfJ82CJ9toBkm5eUhwiQr7uPO1mQg@mail.gmail.com>
From: Antony Pavlov <antonynpavlov@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 2)
X-Received-From: 74.125.82.173
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org,
	Aurelien Jarno <aurelien@aurel32.net>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 1/2] gt64xxx.c: fix length
 modifier in DPRINTF format string
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
X-List-Received-Date: Mon, 26 Sep 2011 05:02:34 -0000

On 26 September 2011 00:56, Peter Maydell <peter.maydell@linaro.org> wrote:
> On 25 September 2011 21:02, Antony Pavlov <antonynpavlov@gmail.com> wrote=
:
>> The commit fc2bf44972349b078d8310466c3866615500e67f
>> changed the type of val argument of the function gt64120_writel()
>> from uint32_t to uint64_t, so we need to change the corresponding
>> length modifier from '%x' to '%llx'.
>
> Revised patch looks OK but you forgot to update the commit message :-)

Aghhhh.

Next time I shell be more lucky. Wait for new patches.

--=20
Best regards,
=A0 Antony Pavlov

