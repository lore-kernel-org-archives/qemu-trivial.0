Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1QNQyC-0004Hs-8z
	for mharc-qemu-trivial@gnu.org; Fri, 20 May 2011 10:46:28 -0400
Received: from eggs.gnu.org ([140.186.70.92]:49289)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1QNQy9-0004Dq-JI
	for qemu-trivial@nongnu.org; Fri, 20 May 2011 10:46:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1QNQy8-0008Oo-Jr
	for qemu-trivial@nongnu.org; Fri, 20 May 2011 10:46:25 -0400
Received: from mail-yx0-f173.google.com ([209.85.213.173]:50542)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1QNQy6-0008OI-5b; Fri, 20 May 2011 10:46:22 -0400
Received: by yxk8 with SMTP id 8so1538681yxk.4
	for <multiple recipients>; Fri, 20 May 2011 07:46:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	bh=QlIIm17YIiohdLd2QmwZXeIdczIZzG8puWF3Zkrnac0=;
	b=A7vx6tIS4w7uu+iI7inToyffbOt1W2mhk+UqjCfZCnEetWBOWQggjAULWKS/vCzlSM
	He91X03SeeHu3MK+TZLLcgvgqcDhRfXM+NLe+N4E2PqwrUqeriK86VSE7eMRgRpmee4N
	O2rqQtdC2T42YMR3ADdoGKkK0gYiDr57Ui7MQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	b=ScI6yRDP/pk0xfyAuX8rK66bqC7zDrQnyDsWnLc2KTnt89NVvPk51vau6BiyIqKwJD
	QiMWWrinSphCB+kyN1bJCCakZIjIojTlA6iFD2KzaSIOZD4JhkEgqKiXI11nZPwhTK+W
	yCmkmWTF+QhNoqA74qFkMYMKhkvYYPWk079dU=
MIME-Version: 1.0
Received: by 10.147.149.11 with SMTP id b11mr3407103yao.11.1305902781390; Fri,
	20 May 2011 07:46:21 -0700 (PDT)
Received: by 10.147.32.3 with HTTP; Fri, 20 May 2011 07:46:21 -0700 (PDT)
In-Reply-To: <1305882713-24997-1-git-send-email-peter.maydell@linaro.org>
References: <1305882713-24997-1-git-send-email-peter.maydell@linaro.org>
Date: Fri, 20 May 2011 15:46:21 +0100
Message-ID: <BANLkTi=pWg6-eejNvmtO6+4V2-AS6sxtDw@mail.gmail.com>
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 2)
X-Received-From: 209.85.213.173
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org, patches@linaro.org
Subject: Re: [Qemu-trivial] [PATCH] hw/sd.c: Don't complain about SDIO
 commands CMD52/CMD53
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
X-List-Received-Date: Fri, 20 May 2011 14:46:27 -0000

On Fri, May 20, 2011 at 10:11 AM, Peter Maydell
<peter.maydell@linaro.org> wrote:
> The SDIO specification introduces new commands 52 and 53.
> Handle as illegal command but do not complain on stderr,
> as SDIO-aware OSes (including Linux) may legitimately use
> these in their probing for presence of an SDIO card.
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
> =A0hw/sd.c | =A0 11 +++++++++++
> =A01 files changed, 11 insertions(+), 0 deletions(-)

Thanks, added to the trivial patches tree:
http://repo.or.cz/w/qemu/stefanha.git/shortlog/refs/heads/trivial-patches

Stefan

