Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1S9aLB-0001ou-Qc
	for mharc-qemu-trivial@gnu.org; Mon, 19 Mar 2012 07:01:29 -0400
Received: from eggs.gnu.org ([208.118.235.92]:47492)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1S9aL3-0001Jw-51
	for qemu-trivial@nongnu.org; Mon, 19 Mar 2012 07:01:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1S9aKw-00026C-UN
	for qemu-trivial@nongnu.org; Mon, 19 Mar 2012 07:01:20 -0400
Received: from mail-wg0-f53.google.com ([74.125.82.53]:59118)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1S9aKk-000256-Er; Mon, 19 Mar 2012 07:01:02 -0400
Received: by wgbfm10 with SMTP id fm10so780318wgb.10
	for <multiple recipients>; Mon, 19 Mar 2012 04:00:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=w/zsxCFj/pxuc1I2nx+9PiUKbnvFhKRyq7eRuQtxdGA=;
	b=I+U7r4NF4SceqBjYvHgVSp5diNniBplbvu15dnbZxRT/jg4A1aIOboNI1q3KKuNyqx
	CF+b8daru0mWyOF7umv0KZLMZL4WZJ1oBPR//QMnQUjUgeUk8soXTuL9ux5FG6h0yvAn
	oGxIB+nbjHkOUTCLBlU5KubAStrSXb24HvaOyY9zMNTvZ5kZElSfbDE71t/Y6WdfZCnG
	vx1yVMSAICddWGI9lf+NeHqiYY7mTzl0Lqjk4yIrLKwvk8KfLqzhnNYlRBbWfmC03ivh
	m6KX0Phm7HpIPKtFK6M3SLbgd2WC7GOFfoTIi9/ml7scwQjpT/BKCKMkWapdvM2Fizzg
	VKIg==
Received: by 10.180.103.35 with SMTP id ft3mr18798682wib.0.1332154859690;
	Mon, 19 Mar 2012 04:00:59 -0700 (PDT)
Received: from localhost (gbibp9ph1--blueice3n2.emea.ibm.com. [195.212.29.84])
	by mx.google.com with ESMTPS id
	w10sm39965557wiy.3.2012.03.19.04.00.58
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 19 Mar 2012 04:00:58 -0700 (PDT)
Date: Mon, 19 Mar 2012 11:00:57 +0000
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Jeff Cody <jcody@redhat.com>
Message-ID: <20120319110057.GA30033@stefanha-thinkpad.localdomain>
References: <dc308d51a38be11f3de7dbc3f66e4716f8b559b3.1331835902.git.jcody@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <dc308d51a38be11f3de7dbc3f66e4716f8b559b3.1331835902.git.jcody@redhat.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 74.125.82.53
Cc: qemu-trivial@nongnu.org, pbonzini@redhat.com, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] qemu-ga: for w32,
 fix leaked handle ov.hEvent in ga_channel_write()
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
X-List-Received-Date: Mon, 19 Mar 2012 11:01:28 -0000

On Thu, Mar 15, 2012 at 02:26:18PM -0400, Jeff Cody wrote:
> In the function ga_channel_write(), the handle ov.hEvent is created
> by the call to CreateEvent(). However, the handle is not closed
> prior to the function return.
> 
> This patch closes the handle before the return of the function.
> 
> Kudos to Paolo Bonzini for spotting this bug.
> 
> Signed-off-by: Jeff Cody <jcody@redhat.com>
> ---
>  qga/channel-win32.c |    4 ++++
>  1 files changed, 4 insertions(+), 0 deletions(-)

Thanks, applied to the trivial patches tree:
https://github.com/stefanha/qemu/commits/trivial-patches

Stefan

