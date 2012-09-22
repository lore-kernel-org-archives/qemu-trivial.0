Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1TFSPi-0000oB-Ix
	for mharc-qemu-trivial@gnu.org; Sat, 22 Sep 2012 12:18:42 -0400
Received: from eggs.gnu.org ([208.118.235.92]:33025)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1TFSPg-0000gF-8Q
	for qemu-trivial@nongnu.org; Sat, 22 Sep 2012 12:18:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1TFSPf-0007Zb-H5
	for qemu-trivial@nongnu.org; Sat, 22 Sep 2012 12:18:40 -0400
Received: from mail-wg0-f53.google.com ([74.125.82.53]:54705)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1TFSPd-0007ZH-LF; Sat, 22 Sep 2012 12:18:37 -0400
Received: by wgbdr1 with SMTP id dr1so2786084wgb.10
	for <multiple recipients>; Sat, 22 Sep 2012 09:18:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=8t7v1vAQZMiNICaPq4p6gBLuC79JDqx0FAVl1/s6laI=;
	b=tXdSr96v8iRgytxHW4zAkwZsl980Wc2XqaX0NFaGM45tXiYV3SOGSGWGfGVc4lD2qb
	3uSKAKqdv0oLbgt4G9kyIGb16brmRVdn5RLLIyzuSEzLyLDOTs+sz64qocBOEVa9124O
	Z2N6vdAP0ew9mKmFqQjIe2KM33TyuilTxrwkp1dPZt/WGwXgqstpaPBpJzenv9qYq6hH
	vcH5GLM5hur/TMgOkxkAphnyCfv04XzsVkz0+pG3LqMytvLq5/qXc/5NOtYL+9l2dqom
	f019cJaPqj1zzQENFBvYK+DPfM8b2Vb55+0AGfdWyrn2+8B4QEFVMjBMyRiCrhl6SfKE
	ZQJw==
Received: by 10.180.109.129 with SMTP id hs1mr3823285wib.0.1348330716703;
	Sat, 22 Sep 2012 09:18:36 -0700 (PDT)
Received: from localhost ([109.224.133.37])
	by mx.google.com with ESMTPS id ct3sm4354600wib.5.2012.09.22.09.18.35
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 22 Sep 2012 09:18:35 -0700 (PDT)
Date: Sat, 22 Sep 2012 17:18:34 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Igor Mammedov <imammedo@redhat.com>
Message-ID: <20120922161834.GA14119@stefanha-thinkpad.localdomain>
References: <1346879185-19299-1-git-send-email-imammedo@redhat.com>
	<20120918175814.1aa12a4c@nial.usersys.redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20120918175814.1aa12a4c@nial.usersys.redhat.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 74.125.82.53
Cc: qemu-trivial@nongnu.org, aliguori@us.ibm.com, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 0/5 v3] convert
 system_powerdown command to notifiers
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
X-List-Received-Date: Sat, 22 Sep 2012 16:18:41 -0000

On Tue, Sep 18, 2012 at 05:58:14PM +0200, Igor Mammedov wrote:
> On Wed,  5 Sep 2012 23:06:20 +0200
> Igor Mammedov <imammedo@redhat.com> wrote:
> 
> ping

This series has acks and should be ready to go.  qemu-trivial is a bit
of a stretch, please merge directly into qemu.git through Anthony, Blue,
etc.

Stefan

