Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1SAds7-0005nI-Av
	for mharc-qemu-trivial@gnu.org; Thu, 22 Mar 2012 04:59:51 -0400
Received: from eggs.gnu.org ([208.118.235.92]:41665)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1SAdrw-0005G5-U3
	for qemu-trivial@nongnu.org; Thu, 22 Mar 2012 04:59:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1SAdrq-0007WJ-Kn
	for qemu-trivial@nongnu.org; Thu, 22 Mar 2012 04:59:40 -0400
Received: from mail-wi0-f181.google.com ([209.85.212.181]:34910)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1SAdrh-0007Uz-2g; Thu, 22 Mar 2012 04:59:25 -0400
Received: by wibhr17 with SMTP id hr17so399611wib.10
	for <multiple recipients>; Thu, 22 Mar 2012 01:59:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=G1SziT2mfGxTBF6xiXItp9+poBxFQZtfsbkida5iJpA=;
	b=lB7HuYGGHnvilyzL6VCIWn3Ixh/+lx0KV5dgqGeDZk5U5V77AY/3q+yLQQNkKkaUov
	f0WUd3yYBQXcXkPgEaJDbPf7FQRBY1LHzQPE4voI2MZs5fjwiLHPRpoYRbKWDgwAGfk4
	B6iH5NyjhqT/PGFSGbo+liEGpc6jrpcYSQ+I8OBupdzFtS1z1CQ610QvljJMZgHEopVO
	F2ZeSFyUsYOlpZS1Go0gD6GZ7VyoX3d7RQrnxtQ/scl9TY8EHiRrueDAx6Mmy6P0Kn6+
	OHcR6mjP1YDtlTlKOnqc0ee184G7FhYQ/CKM7UtO4g/2vvzKbck7tqNFCYEw2cqAo1cd
	aCjQ==
Received: by 10.180.80.35 with SMTP id o3mr3248219wix.5.1332406762365;
	Thu, 22 Mar 2012 01:59:22 -0700 (PDT)
Received: from localhost (gbibp9ph1--blueice2n1.emea.ibm.com. [195.212.29.75])
	by mx.google.com with ESMTPS id fl2sm6341749wib.4.2012.03.22.01.59.21
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 22 Mar 2012 01:59:21 -0700 (PDT)
Date: Thu, 22 Mar 2012 08:14:23 +0000
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Michael Roth <mdroth@linux.vnet.ibm.com>
Message-ID: <20120322081423.GA10257@stefanha-thinkpad.localdomain>
References: <1332202706-25061-1-git-send-email-mdroth@linux.vnet.ibm.com>
	<1332342646-9250-1-git-send-email-mdroth@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1332342646-9250-1-git-send-email-mdroth@linux.vnet.ibm.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.85.212.181
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH v2] test: remove qemu-ga reference
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
X-List-Received-Date: Thu, 22 Mar 2012 08:59:48 -0000

On Wed, Mar 21, 2012 at 10:10:46AM -0500, Michael Roth wrote:
> This was added by mistake a while back.
> 
> Signed-off-by: Michael Roth <mdroth@linux.vnet.ibm.com>
> ---
>  Makefile       |    1 +
>  tests/Makefile |    2 +-
>  2 files changed, 2 insertions(+), 1 deletions(-)

Thanks, applied all 3 patches to the trivial patches tree:
https://github.com/stefanha/qemu/commits/trivial-patches

Stefan

