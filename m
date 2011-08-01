Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Qnpb7-0001CH-El
	for mharc-qemu-trivial@gnu.org; Mon, 01 Aug 2011 06:19:45 -0400
Received: from eggs.gnu.org ([140.186.70.92]:44961)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1Qnpb4-00016j-GJ
	for qemu-trivial@nongnu.org; Mon, 01 Aug 2011 06:19:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1Qnpb3-0002sL-N9
	for qemu-trivial@nongnu.org; Mon, 01 Aug 2011 06:19:42 -0400
Received: from mail-gw0-f45.google.com ([74.125.83.45]:54934)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1Qnpb1-0002rr-GD; Mon, 01 Aug 2011 06:19:39 -0400
Received: by gwb19 with SMTP id 19so4220025gwb.4
	for <multiple recipients>; Mon, 01 Aug 2011 03:19:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	bh=TRguh5k0u1cntRNSBgrN4QC9dVGdfAYlsyc8VhbMl2M=;
	b=HObS7x73NorQq9Y6FPBDzsBZWfHtSqq+qGEf0xBAaII307symvycTkywol370tj1zj
	Vm+u/FBMsRo/zRw33dVZXINQgZw0VWtFErGUgcDHplLMsX+X6XNWYTENZRFY1tjQBgli
	Q4hGNxn7MTBDVZ/VMeo/bIPWLHJYOqjJi8Pjw=
MIME-Version: 1.0
Received: by 10.236.185.7 with SMTP id t7mr3016256yhm.45.1312193978689; Mon,
	01 Aug 2011 03:19:38 -0700 (PDT)
Received: by 10.146.84.20 with HTTP; Mon, 1 Aug 2011 03:19:38 -0700 (PDT)
In-Reply-To: <1312181399-29841-1-git-send-email-david@gibson.dropbear.id.au>
References: <1312181399-29841-1-git-send-email-david@gibson.dropbear.id.au>
Date: Mon, 1 Aug 2011 11:19:38 +0100
Message-ID: <CAJSP0QXvArm0_j0MgsJ2=nJWuGTGSMVTNbPBZYO5S+VuUY-uwA@mail.gmail.com>
From: Stefan Hajnoczi <stefanha@gmail.com>
To: David Gibson <david@gibson.dropbear.id.au>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 2)
X-Received-From: 74.125.83.45
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH] Check fread() results to avoid gcc 4.6
	warnings
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
X-List-Received-Date: Mon, 01 Aug 2011 10:19:43 -0000

On Mon, Aug 1, 2011 at 7:49 AM, David Gibson
<david@gibson.dropbear.id.au> wrote:
> When compiling with gcc 4.6, some code in fw_cfg.c complains that fop_ret
> is assigned but not used (which is true). =A0However, it looks like the
> meaningless assignments to fop_ret were done to suppress other gcc warnin=
gs
> due to the fact that fread() is labelled as warn_unused_result in glibc.
>
> This patch avoids both errors, by actually checking the fread() result co=
de
> and dropping out with an error message if it fails.
>
> Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
> ---
> =A0hw/fw_cfg.c | =A0 13 +++++++++++++
> =A01 files changed, 13 insertions(+), 0 deletions(-)

Reviewed-by: Stefan Hajnoczi <stefanha@linux.vnet.ibm.com>

