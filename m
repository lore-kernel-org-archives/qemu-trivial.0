Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YmzAc-00047A-Si
	for mharc-qemu-trivial@gnu.org; Tue, 28 Apr 2015 02:39:02 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50808)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <th.huth@gmail.com>) id 1YmzAa-00045d-MK
	for qemu-trivial@nongnu.org; Tue, 28 Apr 2015 02:39:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <th.huth@gmail.com>) id 1YmzAZ-00052y-Qe
	for qemu-trivial@nongnu.org; Tue, 28 Apr 2015 02:39:00 -0400
Received: from mail-wi0-f179.google.com ([209.85.212.179]:38363)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <th.huth@gmail.com>)
	id 1YmzAT-0004pd-CV; Tue, 28 Apr 2015 02:38:53 -0400
Received: by wiun10 with SMTP id n10so16469788wiu.1;
	Mon, 27 Apr 2015 23:38:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=date:from:to:subject:message-id:in-reply-to:references:mime-version
	:content-type:content-transfer-encoding;
	bh=l0X4G4QG7kg41DibDMOCrzI2Va3l3ze/bpkrLH4CUh4=;
	b=MKOLaj9x6k/4g+uwG8THQ+z3dCGPmkllbpD6Dw9DhaRzvj0GhkP5Prj12wsQsQZ+dh
	RoBXsqy212+3UerL/GESgoYnZRABGHc9HaSICKR5Ieu+RzZa471LV3pCKABK5nNpwopS
	qZPqI8YLPrVVimj/x0A9HBbawKy7euZOZmSN96RKZfE4kSS+K/cIx2O0hholtqVNZZzP
	VN+anYISHasv5OtfDQhZpoi2X1lFzr2AWB+ZuZAMeJNHmYXKTlm4S4xcAlmG3jPZmFyB
	3msO2MCqfQ1GmkNRTvluSUGYQFq7n3clfIZ2WunQBQByZnlqzjSvM6//8dXQbhNC4srd
	EfxA==
X-Received: by 10.180.8.34 with SMTP id o2mr26873638wia.18.1430203132304;
	Mon, 27 Apr 2015 23:38:52 -0700 (PDT)
Received: from tpl530 (p57AEE0A8.dip0.t-ipconnect.de. [87.174.224.168])
	by mx.google.com with ESMTPSA id u6sm32559535wjy.13.2015.04.27.23.38.49
	(version=SSLv3 cipher=RC4-SHA bits=128/128);
	Mon, 27 Apr 2015 23:38:51 -0700 (PDT)
Date: Tue, 28 Apr 2015 08:38:49 +0200
From: Thomas Huth <huth@tuxfamily.org>
To: qemu-devel@nongnu.org, qemu-trivial@nongnu.org, Stefan Weil
	<sw@weilnetz.de>, Michael Tokarev <mjt@tls.msk.ru>
Message-ID: <20150428083849.5319c456@tpl530>
In-Reply-To: <20150428082846.1348066e@thh440s>
References: <20150428082846.1348066e@thh440s>
X-Mailer: Claws Mail 3.9.3 (GTK+ 2.24.23; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.212.179
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v2 0/7] Remove more unused
	functions
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
X-List-Received-Date: Tue, 28 Apr 2015 06:39:01 -0000

> Date: Mon, 27 Apr 2015 20:09:50 +0200
> From: Stefan Weil <sw@weilnetz.de>
> 
> Am 27.04.2015 um 13:27 schrieb Michael Tokarev:
> > 14.03.2015 09:19, Thomas Huth wrote:
> >> Here are some more patches to remove completely unused functions
> >> from QEMU. Please review carefully, some of the functions might
> >> still get usefull in the future again, so if you discover one,
> >> please let me know, then I'll remove it from the patch series
> >> again.
> > Applied to -trivial, thank you!
> >
> > /mjt
> 
> I'm sorry that I did not notice this series earlier.
> 
> The function serial_set_frequency() is used in my personal branch for 
> MIPS AR7.

Ok, since this function still could be again useful in the future,
could you simply drop the related patch from your queue again, Michael?
(or just drop the related hunks in the patch if you've got some spare
time to rework it? If not, I could do that at a later point in time and
send a new patch).

 Thanks,
  Thomas

