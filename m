Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1U0Uko-0005oB-V7
	for mharc-qemu-trivial@gnu.org; Wed, 30 Jan 2013 05:18:54 -0500
Received: from eggs.gnu.org ([208.118.235.92]:40214)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1U0Ukk-0005ey-Mr
	for qemu-trivial@nongnu.org; Wed, 30 Jan 2013 05:18:52 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1U0Ukj-0001fZ-AD
	for qemu-trivial@nongnu.org; Wed, 30 Jan 2013 05:18:50 -0500
Received: from mail-ee0-f48.google.com ([74.125.83.48]:36044)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1U0Ukg-0001eb-If; Wed, 30 Jan 2013 05:18:46 -0500
Received: by mail-ee0-f48.google.com with SMTP id t10so699166eei.7
	for <multiple recipients>; Wed, 30 Jan 2013 02:18:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition
	:content-transfer-encoding:in-reply-to:user-agent;
	bh=hTUHFJ9udkd2VuPzrl9jmQsSD+pSwf4uX1aPOujjECs=;
	b=ceHxr+Tq6jwhDd+LqUPNRCjoN/93XfEvObFedOz84pF/VMmte5AompE/dF+QfJcOge
	9ZupMtaWMzlkBhctjj5k4/NPxRVALaJOmGr/qZ8OT06mZ5J4jPkk0+HEttWPNM+am1Pg
	HBQW15coIxPl6jN67S0Z/HrJiyQD/9qYJWaZlDvemUIcOPCudxnEjck3RDhINRtFysR8
	t0tDW3t2Dr41fObgeD21b9seOJ+2ut1EbaBlPn7moEy3oZmbW22PuWvtxiKcq6EkS70c
	nnz2qiPaUD0V0Vfy/EakiZGsA5sBIPsHJOX3m4aVrGZ6+1WchoqjQNX+1yMTqNEzSXJO
	93aA==
X-Received: by 10.14.225.72 with SMTP id y48mr13450786eep.46.1359541125473;
	Wed, 30 Jan 2013 02:18:45 -0800 (PST)
Received: from localhost (178-26-141-215-dynip.superkabel.de. [178.26.141.215])
	by mx.google.com with ESMTPS id 46sm1238747eeg.4.2013.01.30.02.18.43
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Wed, 30 Jan 2013 02:18:44 -0800 (PST)
Date: Wed, 30 Jan 2013 11:18:42 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Andreas =?iso-8859-1?Q?F=E4rber?= <andreas.faerber@web.de>
Message-ID: <20130130101842.GB29972@stefanha-thinkpad.redhat.com>
References: <1359210479-12807-1-git-send-email-andreas.faerber@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1359210479-12807-1-git-send-email-andreas.faerber@web.de>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 74.125.83.48
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org, qemu-stable@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH for-1.4] tests: Fix {rtc,
 m48t59}-test build on illumos
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
X-List-Received-Date: Wed, 30 Jan 2013 10:18:52 -0000

On Sat, Jan 26, 2013 at 03:27:59PM +0100, Andreas Färber wrote:
> Struct tm does not have tm_gmtoff field on illumos.
> Fix the build by not zero-initializing these fields on Solaris.
> 
> Cc: qemu-stable@nongnu.org
> Signed-off-by: Andreas Färber <andreas.faerber@web.de>
> ---
>  tests/m48t59-test.c |    2 ++
>  tests/rtc-test.c    |    2 ++
>  2 Dateien geändert, 4 Zeilen hinzugefügt(+)

Thanks, applied to the trivial patches tree:
https://github.com/stefanha/qemu/commits/trivial-patches

Stefan

