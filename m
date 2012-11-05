Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1TVJuC-00053V-Ek
	for mharc-qemu-trivial@gnu.org; Mon, 05 Nov 2012 05:27:44 -0500
Received: from eggs.gnu.org ([208.118.235.92]:50718)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1TVJu9-0004vA-Pt
	for qemu-trivial@nongnu.org; Mon, 05 Nov 2012 05:27:42 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1TVJu8-0000nO-Ji
	for qemu-trivial@nongnu.org; Mon, 05 Nov 2012 05:27:41 -0500
Received: from mail-lb0-f173.google.com ([209.85.217.173]:53579)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1TVJtx-0000m1-7E; Mon, 05 Nov 2012 05:27:29 -0500
Received: by mail-lb0-f173.google.com with SMTP id gj3so3742358lbb.4
	for <multiple recipients>; Mon, 05 Nov 2012 02:27:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=Fb9CCngpKMj9/SsNnBVzqv6cgGaOevmEoTqf791G78c=;
	b=OY3MVYuRL21d0Pv/Fel+mSF79E8p39qTGLCEguf7bBXOldKo1nm+vz7/Bs6A32bYKz
	1KyZFZVvoUXrSHgI0NSEjbfROZlLR/VND90D4YZlCGokaH2I2mYqXS6jSUx88tdHJ0Sy
	JODRZ/mJNS5Czx5ZOJ5RK+PR8hsOs68pJOkw/SCOAq1cA66k3Lti5j27EIwWICW6qHqZ
	z04L65IgsGoPjEc9j94UyDKMAzvTlbVxSRKdHFVo4CivOCdy+Iqgn4dbmMMJpNrZ/ouI
	Jg00kZS5JsquLWFokO3ZMbSUaGaCKUt/nPYhyfyvDhRqwLpg2W4Uf0Hb6G9fjma7qHA7
	d0xQ==
MIME-Version: 1.0
Received: by 10.112.82.103 with SMTP id h7mr3793570lby.50.1352111247877; Mon,
	05 Nov 2012 02:27:27 -0800 (PST)
Received: by 10.112.23.37 with HTTP; Mon, 5 Nov 2012 02:27:27 -0800 (PST)
In-Reply-To: <1352101300-12060-1-git-send-email-lig.fnst@cn.fujitsu.com>
References: <1352101300-12060-1-git-send-email-lig.fnst@cn.fujitsu.com>
Date: Mon, 5 Nov 2012 11:27:27 +0100
Message-ID: <CAJSP0QXytL5YBzx2S1qQ0SOHJ6-Ke15kVbqC7Q12_PFWQOeGeA@mail.gmail.com>
From: Stefan Hajnoczi <stefanha@gmail.com>
To: liguang <lig.fnst@cn.fujitsu.com>
Content-Type: text/plain; charset=ISO-8859-1
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 209.85.217.173
Cc: qemu-trivial <qemu-trivial@nongnu.org>, Kevin Wolf <kwolf@redhat.com>,
	qemu-devel <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [Qemu-devel][PATCH v4] correct error message
 qemu-img reported
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
X-List-Received-Date: Mon, 05 Nov 2012 10:27:42 -0000

On Mon, Nov 5, 2012 at 8:41 AM, liguang <lig.fnst@cn.fujitsu.com> wrote:
> qemu-img will complain when qcow or qcow2
> size overflow for 64 bits, report the right
> message in this condition.
>
> Signed-off-by: liguang <lig.fnst@cn.fujitsu.com>
> ---
>  qemu-img.c |    7 ++++++-
>  1 files changed, 6 insertions(+), 1 deletions(-)

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

