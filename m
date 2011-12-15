Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1RbBp3-0002Ii-85
	for mharc-qemu-trivial@gnu.org; Thu, 15 Dec 2011 08:58:09 -0500
Received: from eggs.gnu.org ([140.186.70.92]:50004)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1RbBor-0001do-Ss
	for qemu-trivial@nongnu.org; Thu, 15 Dec 2011 08:58:07 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1RbBon-00025C-M5
	for qemu-trivial@nongnu.org; Thu, 15 Dec 2011 08:57:57 -0500
Received: from mail-ww0-f53.google.com ([74.125.82.53]:40472)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1RbBod-00023u-Pp; Thu, 15 Dec 2011 08:57:43 -0500
Received: by wgbds1 with SMTP id ds1so3661414wgb.10
	for <multiple recipients>; Thu, 15 Dec 2011 05:57:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	bh=ufxR7CM1RrEGbfYSVHF+OAFjokd/MFLe1UuRIFRAlU8=;
	b=VuNKJFBf4M7PRUEmN+gtgyutJyemnHz+Mtg4vK7EaIVWcoi16kZWMBy9Ft6Wsv8nWl
	CecpSX2Qn4agIx2hfMSggRxGSxn1Yr3YEdgI2spiOK5cuUgYIdNHmzSpoBcJpoBcVVEo
	VLXH/+8l9VBqD9BZ7X/C8CxNOvj6ywrU7+Rf4=
MIME-Version: 1.0
Received: by 10.227.206.205 with SMTP id fv13mr2835773wbb.17.1323957360030;
	Thu, 15 Dec 2011 05:56:00 -0800 (PST)
Received: by 10.180.101.168 with HTTP; Thu, 15 Dec 2011 05:55:59 -0800 (PST)
In-Reply-To: <1323956034-21468-1-git-send-email-peter.maydell@linaro.org>
References: <1323956034-21468-1-git-send-email-peter.maydell@linaro.org>
Date: Thu, 15 Dec 2011 13:55:59 +0000
Message-ID: <CAJSP0QVo0wU8fXb=0FpVHTim2Zpbgt-Mpgjswf+pb9zbNo5_3g@mail.gmail.com>
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 2)
X-Received-From: 74.125.82.53
Cc: qemu-trivial@nongnu.org, Kevin Wolf <kwolf@redhat.com>,
	qemu-devel@nongnu.org, patches@linaro.org
Subject: Re: [Qemu-trivial] [PATCH] HACKING: clarify allocation/free
	recommendations
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
X-List-Received-Date: Thu, 15 Dec 2011 13:58:07 -0000

On Thu, Dec 15, 2011 at 1:33 PM, Peter Maydell <peter.maydell@linaro.org> w=
rote:
> Clarify the allocation/free recommendations; this is mostly
> just tidying up following the global-search-and-replace done
> with the conversion to the GLib g_malloc and friends.
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
> =A0HACKING | =A0 10 ++++++----
> =A01 files changed, 6 insertions(+), 4 deletions(-)

Reviewed-by: Stefan Hajnoczi <stefanha@linux.vnet.ibm.com>

