Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1RNRzu-000234-Dw
	for mharc-qemu-trivial@gnu.org; Mon, 07 Nov 2011 11:24:34 -0500
Received: from eggs.gnu.org ([140.186.70.92]:60315)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1RNRzo-0001i7-Hy
	for qemu-trivial@nongnu.org; Mon, 07 Nov 2011 11:24:32 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1RNRzk-0008Jz-QA
	for qemu-trivial@nongnu.org; Mon, 07 Nov 2011 11:24:28 -0500
Received: from mail-fx0-f45.google.com ([209.85.161.45]:44572)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1RNRzc-0008I5-Gb; Mon, 07 Nov 2011 11:24:16 -0500
Received: by faap15 with SMTP id p15so6437173faa.4
	for <multiple recipients>; Mon, 07 Nov 2011 08:24:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:content-transfer-encoding
	:in-reply-to:user-agent;
	bh=9fE1gFU5DhjKgCZ1/yZJdbJwQWCzZLty35MsckTXI/0=;
	b=RCtzJb/Xt2lV4dxAuMkrebAxtshaEqgL4dLZKjptBF2bdcz56mqkbzapgPLyluPuFw
	llFLmj2/MpsFaSTAZfbd2OUWuCoRqwosHR5GVORa5lGi+srs4avQ6SD1Qp+226Q3sf4e
	R2FrEY57UMtrb3reoJgKSKPfidyamrGe0DVuU=
Received: by 10.223.15.13 with SMTP id i13mr16835394faa.36.1320683055534;
	Mon, 07 Nov 2011 08:24:15 -0800 (PST)
Received: from localhost (gbibp9ph1--blueice3n2.emea.ibm.com. [195.212.29.84])
	by mx.google.com with ESMTPS id
	g25sm31757719fae.16.2011.11.07.08.24.14
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 07 Nov 2011 08:24:15 -0800 (PST)
Date: Mon, 7 Nov 2011 16:24:13 +0000
From: Stefan Hajnoczi <stefanha@gmail.com>
To: qemu-devel@nongnu.org
Message-ID: <20111107162413.GD14396@stefanha-thinkpad.localdomain>
References: <20111105010654.GA79132@cs.nctu.edu.tw>
	<20111107081801.GE9450@stefanha-thinkpad.localdomain>
	<20111107094705.GA20921@cs.nctu.edu.tw>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20111107094705.GA20921@cs.nctu.edu.tw>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 2)
X-Received-From: 209.85.161.45
Cc: qemu-trivial@nongnu.org,
	=?utf-8?B?6Zmz6Z+L5Lu7?= <chenwj@iis.sinica.edu.tw>
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
X-List-Received-Date: Mon, 07 Nov 2011 16:24:32 -0000

On Mon, Nov 07, 2011 at 05:47:05PM +0800, 陳韋任 wrote:
> On Mon, Nov 07, 2011 at 08:18:01AM +0000, Stefan Hajnoczi wrote:
> > On Sat, Nov 05, 2011 at 09:06:54AM +0800, 陳韋任 wrote:
> > >   According to [1], libqemu is not available anymore. Remove libqemu
> > > from QEMU generic features.
> > > 
> > > [1] http://www.mail-archive.com/qemu-devel@nongnu.org/msg49809.html
> > 
> > Then perhaps we should get rid of tests/qruncom.c too?
> 
>   I think so. But I don't know if anyone object this. Is it O.K. cc
> this to qemu-devel@nongnu.org ?

I suggest sending a patch that removes all references to libqemu.a and
tests/qruncom.c.  Send it to qemu-devel instead of qemu-trivial and see
if anyone complains :).

Stefan

