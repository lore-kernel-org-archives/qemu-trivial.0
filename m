Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1RNRuT-0001IE-J5
	for mharc-qemu-trivial@gnu.org; Mon, 07 Nov 2011 11:18:57 -0500
Received: from eggs.gnu.org ([140.186.70.92]:40665)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1RNRuR-0001Hx-6E
	for qemu-trivial@nongnu.org; Mon, 07 Nov 2011 11:18:56 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1RNRuP-0007Os-OY
	for qemu-trivial@nongnu.org; Mon, 07 Nov 2011 11:18:55 -0500
Received: from mail-fx0-f45.google.com ([209.85.161.45]:59265)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1RNRuP-0007Ae-D7
	for qemu-trivial@nongnu.org; Mon, 07 Nov 2011 11:18:53 -0500
Received: by mail-fx0-f45.google.com with SMTP id p15so6429974faa.4
	for <qemu-trivial@nongnu.org>; Mon, 07 Nov 2011 08:18:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:content-transfer-encoding
	:in-reply-to:user-agent;
	bh=7IiE0cGg2zyn9Qa+1lEl54shO1OMXMyUoa7BqVljnTA=;
	b=g15hJ026sPoYx+8f7LTKjwzSrRnEo+C7ENjh1d7iVsOblYGSru+H4i1UZznBucWoUb
	ibBJkm7X04yRtyQJLhcRp9urvPKnMUmOw+g0CuAHMT4F9XlLq7G9Uc+4AWu4Cp/Ke3Zv
	365V4K7l0jsmthmD/jDoKhq3LMdjkcfinDncA=
Received: by 10.223.62.209 with SMTP id y17mr47567183fah.7.1320682731548;
	Mon, 07 Nov 2011 08:18:51 -0800 (PST)
Received: from localhost (gbibp9ph1--blueice3n2.emea.ibm.com. [195.212.29.84])
	by mx.google.com with ESMTPS id
	n25sm31747439fah.15.2011.11.07.08.18.50
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 07 Nov 2011 08:18:51 -0800 (PST)
Date: Mon, 7 Nov 2011 16:18:49 +0000
From: Stefan Hajnoczi <stefanha@gmail.com>
To: =?utf-8?B?6Zmz6Z+L5Lu7?= <chenwj@iis.sinica.edu.tw>
Message-ID: <20111107161849.GB14396@stefanha-thinkpad.localdomain>
References: <20111104171444.GA85143@cs.nctu.edu.tw>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20111104171444.GA85143@cs.nctu.edu.tw>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 2)
X-Received-From: 209.85.161.45
Cc: qemu-trivial@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH] qemu-tech.texi: Update default code
 cache size
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
X-List-Received-Date: Mon, 07 Nov 2011 16:18:56 -0000

On Sat, Nov 05, 2011 at 01:14:44AM +0800, 陳韋任 wrote:
>   Update the document since the default code cache size is 32 MB now.
> 
> Signed-off-by: chenwj <chenwj@cs.nctu.edu.tw>
> ---
>  qemu-tech.texi |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)

Thanks, applied to the trivial patches -next tree:
http://repo.or.cz/w/qemu/stefanha.git/shortlog/refs/heads/trivial-patches-next

Stefan

