Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1RNLOY-0007Af-Ra
	for mharc-qemu-trivial@gnu.org; Mon, 07 Nov 2011 04:21:34 -0500
Received: from eggs.gnu.org ([140.186.70.92]:34693)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1RNLOV-0006zN-Bv
	for qemu-trivial@nongnu.org; Mon, 07 Nov 2011 04:21:32 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1RNLOT-0001ND-SE
	for qemu-trivial@nongnu.org; Mon, 07 Nov 2011 04:21:31 -0500
Received: from mail-fx0-f45.google.com ([209.85.161.45]:56270)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1RNLOT-0001L3-Mk
	for qemu-trivial@nongnu.org; Mon, 07 Nov 2011 04:21:29 -0500
Received: by mail-fx0-f45.google.com with SMTP id p15so5986632faa.4
	for <qemu-trivial@nongnu.org>; Mon, 07 Nov 2011 01:21:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:content-transfer-encoding
	:in-reply-to:user-agent;
	bh=R8nUmqu2nZFNkxPL69RrHHnFQiqXO17+oyXQs1q2kfQ=;
	b=OKouZ2uwhZO80uezOzDUSsNJ7tcEixv4RwO1Y+YRF/hYqByxzozsXtLZ9CxSBZipvS
	wjX/5TlKNTcyFmjFbzTCE7ipDFl/ySHSfZX9BUk8E0/Te1CB7mV0CKt7COcCJTy5JBcr
	sU6RqorDf/m7LtEmhwRvJP8CHa/wNowsGA11U=
Received: by 10.223.30.149 with SMTP id u21mr45988861fac.18.1320657689026;
	Mon, 07 Nov 2011 01:21:29 -0800 (PST)
Received: from localhost (gbibp9ph1--blueice3n2.emea.ibm.com. [195.212.29.84])
	by mx.google.com with ESMTPS id f4sm22143537faj.1.2011.11.07.01.21.28
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 07 Nov 2011 01:21:28 -0800 (PST)
Date: Mon, 7 Nov 2011 08:18:01 +0000
From: Stefan Hajnoczi <stefanha@gmail.com>
To: =?utf-8?B?6Zmz6Z+L5Lu7?= <chenwj@iis.sinica.edu.tw>
Message-ID: <20111107081801.GE9450@stefanha-thinkpad.localdomain>
References: <20111105010654.GA79132@cs.nctu.edu.tw>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20111105010654.GA79132@cs.nctu.edu.tw>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 2)
X-Received-From: 209.85.161.45
Cc: qemu-trivial@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH] qemu-tech.texi: Remove libqemu from QEMU
 generic features
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
X-List-Received-Date: Mon, 07 Nov 2011 09:21:33 -0000

On Sat, Nov 05, 2011 at 09:06:54AM +0800, 陳韋任 wrote:
>   According to [1], libqemu is not available anymore. Remove libqemu
> from QEMU generic features.
> 
> [1] http://www.mail-archive.com/qemu-devel@nongnu.org/msg49809.html

Then perhaps we should get rid of tests/qruncom.c too?

Stefan

