Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UJ3Pr-0007xn-H6
	for mharc-qemu-trivial@gnu.org; Fri, 22 Mar 2013 10:57:59 -0400
Received: from eggs.gnu.org ([208.118.235.92]:47092)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1UJ3Pk-0007pd-UX
	for qemu-trivial@nongnu.org; Fri, 22 Mar 2013 10:57:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1UJ3Pj-00036q-5T
	for qemu-trivial@nongnu.org; Fri, 22 Mar 2013 10:57:52 -0400
Received: from mail-wg0-f54.google.com ([74.125.82.54]:35604)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1UJ3Pi-00035v-Vl; Fri, 22 Mar 2013 10:57:51 -0400
Received: by mail-wg0-f54.google.com with SMTP id fm10so339034wgb.9
	for <multiple recipients>; Fri, 22 Mar 2013 07:57:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=X/1mOeBXioQFykAZnnQyCbjmT2vd+3MpMmF772AkR5c=;
	b=zYPuf4z8MPiWaO28laX59vIpAFILDxOFlrnIDi6IG/oUnrzXzslPTFV7NAvTCw+d3+
	RL560ag1UGmD57vrlJP/K+ExpTD6PuiZ1qNRTWyaGuglSbOImGCHYUbAwsIzGOiGwPNX
	oqp8ZPYEJs4caL46piNMd0zY2Qaf1GEvPVd6hDijS2iGsyuIRkr2Qxfsne/NJVo5V4Wc
	cf70RWLfzSKhKidBmViJF3qX7bmHwCdOJZ2+1NMfHiQd0a5WzgymAnCuEQFPkG8Qm+bS
	Ek14fFJ8EVHyvq4BXCWqNnjwBWrVYHSXw/GODB2YDjqqUTZirhpSA7pt0JiAvQ0Z5QrM
	k8tw==
X-Received: by 10.180.103.40 with SMTP id ft8mr11935516wib.28.1363964270034;
	Fri, 22 Mar 2013 07:57:50 -0700 (PDT)
Received: from localhost ([2a02:810d:ec0:195:81b0:6069:490c:9a88])
	by mx.google.com with ESMTPS id ed6sm4021474wib.9.2013.03.22.07.57.48
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Fri, 22 Mar 2013 07:57:49 -0700 (PDT)
Date: Fri, 22 Mar 2013 15:57:47 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: liguang <lig.fnst@cn.fujitsu.com>
Message-ID: <20130322145747.GB948@stefanha-thinkpad.redhat.com>
References: <1363941854-27111-1-git-send-email-lig.fnst@cn.fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1363941854-27111-1-git-send-email-lig.fnst@cn.fujitsu.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 74.125.82.54
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] gitignore: ignore more files
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
X-List-Received-Date: Fri, 22 Mar 2013 14:57:58 -0000

On Fri, Mar 22, 2013 at 04:44:13PM +0800, liguang wrote:
> ignore *.patch, *.gcda, *.gcno
> 
> Signed-off-by: liguang <lig.fnst@cn.fujitsu.com>
> ---
>  .gitignore |    3 +++
>  1 files changed, 3 insertions(+), 0 deletions(-)

Merged this and the next patch you sent.

Thanks, applied to the trivial patches tree:
https://github.com/stefanha/qemu/commits/trivial-patches

Stefan

