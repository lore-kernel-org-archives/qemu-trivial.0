Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1SMxlR-0006DT-Cs
	for mharc-qemu-trivial@gnu.org; Wed, 25 Apr 2012 04:39:53 -0400
Received: from eggs.gnu.org ([208.118.235.92]:43939)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1SMxlN-00061m-Gd
	for qemu-trivial@nongnu.org; Wed, 25 Apr 2012 04:39:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1SMxlL-00066Q-IA
	for qemu-trivial@nongnu.org; Wed, 25 Apr 2012 04:39:49 -0400
Received: from mail-wi0-f169.google.com ([209.85.212.169]:65273)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1SMxlH-0005zC-Ji; Wed, 25 Apr 2012 04:39:43 -0400
Received: by wibhm17 with SMTP id hm17so4521965wib.4
	for <multiple recipients>; Wed, 25 Apr 2012 01:39:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=edcKbe2uRrwitNOOWBz/mtSJBb+42P90S4DKzxUJ2oA=;
	b=CSSNTE7yZFAA7MnVyEremH0235VK6ZfgcRU2C0tQDOEBJPlH0Vz70m/aoLfrsSEirF
	hegQWlfZFkuSVDUk13wjXHuf1/QyaaaFbnb36SZAb5WbybQdDv9y8ItpKy7rkwT2Be3W
	p7kBoa0kYtthJiq2be4x1g+TX0kGTVGFj6yo47kfeUOE72rBMh32aJQE3RItQ789bUnn
	Vj1l5J/DTdNFKyOl92Y64NcgQSeqAHd23Qr7XgJzD9SMlWMGEmJRm85CQspJFVJFM9Dr
	ySK9FbUbZtPy7T3DqfplAWSIXCVSSQb2MQpQyuJvoHzpRThp+ldS7NAiXpDb567czXsf
	RgzA==
Received: by 10.180.78.164 with SMTP id c4mr39074046wix.10.1335343180882;
	Wed, 25 Apr 2012 01:39:40 -0700 (PDT)
Received: from localhost ([109.224.133.37])
	by mx.google.com with ESMTPS id gd4sm56418206wib.6.2012.04.25.01.39.39
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 25 Apr 2012 01:39:40 -0700 (PDT)
Date: Wed, 25 Apr 2012 09:39:39 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Stefan Weil <sw@weilnetz.de>
Message-ID: <20120425083939.GA15165@stefanha-thinkpad.localdomain>
References: <20120319113006.GC30033@stefanha-thinkpad.localdomain>
	<1332159647-9456-1-git-send-email-sw@weilnetz.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1332159647-9456-1-git-send-email-sw@weilnetz.de>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.85.212.169
Cc: qemu-trivial <qemu-trivial@nongnu.org>, peter.maydell@linaro.org,
	qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v2] configure: Fix creation
 of symbolic links for MinGW toolchain
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
X-List-Received-Date: Wed, 25 Apr 2012 08:39:51 -0000

On Mon, Mar 19, 2012 at 01:20:47PM +0100, Stefan Weil wrote:
> The MinGW toolchain on w32/w64 hosts does not create symbolic links,
> but implements 'ln -s' similar to 'cp -r'.
> 
> In incremental out of tree builds, this resulted in files which
> were not updated when their counterparts in the QEMU source tree
> changed. Especially for Makefile* this happened very often.
> 
> With this patch, the 'symlinked' files are now always updated for
> out of tree builds. Similar code was already used for the symbolic
> link of libcacard/Makefile.
> 
> The symlink macro always removes the target before it is created
> again, therefore the rm command for libcacard/Makefile was redundant
> and is removed now.
> 
> Macro symlink is also used with directories. To remove them on w32
> hosts, a recursive rm is needed.
> 
> v2:
> Quote arguments in shell function symlink, and also quote any argument
> which is passed to symlink and which contains macros. This should reduce
> the chance of accidents caused by rm -rf.
> 
> Signed-off-by: Stefan Weil <sw@weilnetz.de>
> ---
>  configure |   21 ++++++++++-----------
>  1 files changed, 10 insertions(+), 11 deletions(-)

Sorry, this got lost in my inbox.  If you send patch revisions as
top-level emails then it's easier to notice them.  I probably marked it
as read and forgot about it because being part of the original email
thread made it appear like the discussion was still continuing.

Thanks, applied to the trivial patches tree:
https://github.com/stefanha/qemu/commits/trivial-patches

Stefan

