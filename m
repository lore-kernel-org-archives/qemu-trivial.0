Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1RVg9o-0002Zo-KI
	for mharc-qemu-trivial@gnu.org; Wed, 30 Nov 2011 04:08:48 -0500
Received: from eggs.gnu.org ([140.186.70.92]:47054)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1RVg9k-0002PU-Vr
	for qemu-trivial@nongnu.org; Wed, 30 Nov 2011 04:08:46 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1RVg9k-0001uQ-1w
	for qemu-trivial@nongnu.org; Wed, 30 Nov 2011 04:08:44 -0500
Received: from mail-ey0-f173.google.com ([209.85.215.173]:55966)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1RVg9h-0001tt-It; Wed, 30 Nov 2011 04:08:41 -0500
Received: by eaai10 with SMTP id i10so456654eaa.4
	for <multiple recipients>; Wed, 30 Nov 2011 01:08:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	bh=bW6B3oDRjkMhCrTTUCF+uBj94CZYCA/Cgs/DMFS9c7w=;
	b=Oh5bDCW+GLGduvCbuewgSva9VpfLTMchJXc4RGl4l4zwl3zsq0Vu0Xllg3RE4Xnt6x
	2hQQNmuOuXJM2LJ+R9dakTu0FSTCl3MCIf7TRJkTKM5GPa+WASh3WaH2UR9I6PhByVMm
	DqqXxbk3V+eN6Z+wLJFWpalgo4/BRdEc7V4B8=
MIME-Version: 1.0
Received: by 10.180.103.170 with SMTP id fx10mr1016195wib.56.1322644120445;
	Wed, 30 Nov 2011 01:08:40 -0800 (PST)
Received: by 10.180.101.168 with HTTP; Wed, 30 Nov 2011 01:08:40 -0800 (PST)
In-Reply-To: <1322606869-25865-1-git-send-email-mdroth@linux.vnet.ibm.com>
References: <4ED3F1C3.4060601@weilnetz.de>
	<1322606869-25865-1-git-send-email-mdroth@linux.vnet.ibm.com>
Date: Wed, 30 Nov 2011 09:08:40 +0000
Message-ID: <CAJSP0QVUTHg67bRGG=m-t_+6WUVjumqWD63juRn+LXsyLvmrhg@mail.gmail.com>
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Michael Roth <mdroth@linux.vnet.ibm.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 2)
X-Received-From: 209.85.215.173
Cc: qemu-trivial@nongnu.org, sw@weilnetz.de, qemu-devel@nongnu.org,
	stefano.stabellini@eu.citrix.com
Subject: Re: [Qemu-trivial] [PATCH 1/2] qapi: fix guardname generation
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
X-List-Received-Date: Wed, 30 Nov 2011 09:08:46 -0000

On Tue, Nov 29, 2011 at 10:47 PM, Michael Roth
<mdroth@linux.vnet.ibm.com> wrote:
> Fix a bug in handling dotted paths, and exclude directory prefixes
> from generated guardnames to avoid odd/pseudo-random guardnames in
> generated headers.
> ---
> =A0scripts/qapi.py | =A0 =A07 ++++---
> =A01 files changed, 4 insertions(+), 3 deletions(-)

Reviewed-by: Stefan Hajnoczi <stefanha@linux.vnet.ibm.com>

