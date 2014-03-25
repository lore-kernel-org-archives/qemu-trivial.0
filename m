Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WSQlr-0004Ja-Ir
	for mharc-qemu-trivial@gnu.org; Tue, 25 Mar 2014 08:47:59 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49491)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1WSQll-00049W-9R
	for qemu-trivial@nongnu.org; Tue, 25 Mar 2014 08:47:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1WSQlf-0001t4-Ud
	for qemu-trivial@nongnu.org; Tue, 25 Mar 2014 08:47:53 -0400
Received: from mail-wi0-x229.google.com ([2a00:1450:400c:c05::229]:45864)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1WSQlU-0001dG-Qm; Tue, 25 Mar 2014 08:47:36 -0400
Received: by mail-wi0-f169.google.com with SMTP id hm4so3389638wib.4
	for <multiple recipients>; Tue, 25 Mar 2014 05:47:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=nCvFoTHsb9kpQ2U0YqcOdggkUwFJMUCVaPsGuIV2sL4=;
	b=Z34OjS4+ZOak9wgMtxdlCa/HNe6fCWXuImjGu9FtKLqY34B27nDYiPXuexMalEVHwy
	IF5O2jFE3a9qGjbwqxfXBXgs/PjMXLcrNhSLpJjBUvij7y7EAYilhkO7Hu2YZl/DAB2d
	xwFbko+BrptdjoPIzW8v/AhM1rmnLkn9oyU2ZdwpdSD66VelhxXpJVkOqcIw9Oq8J/02
	nHO+QUh6DZZK+FCKQwalLB83/XHs3d6YWo+lLZkIHDfiF8MpXDygFZBhqC5OYV9sRf+L
	2Vatq89dsDBIWXaMpyzIYRPlyivVK+tyzIXXTCdpO/QgivynTmOS+DLLXun+NGbScU3l
	/hcQ==
X-Received: by 10.180.149.143 with SMTP id ua15mr21336834wib.36.1395751655793; 
	Tue, 25 Mar 2014 05:47:35 -0700 (PDT)
Received: from localhost (95-91-232-83-dynip.superkabel.de. [95.91.232.83])
	by mx.google.com with ESMTPSA id fo6sm50096444wib.7.2014.03.25.05.47.34
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 25 Mar 2014 05:47:34 -0700 (PDT)
Date: Tue, 25 Mar 2014 13:47:33 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Deepak Kathayat <deepak.mk17@gmail.com>
Message-ID: <20140325124733.GD29231@stefanha-thinkpad.redhat.com>
References: <1395641175-30878-1-git-send-email-deepak.mk17@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1395641175-30878-1-git-send-email-deepak.mk17@gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a00:1450:400c:c05::229
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org, stefanha@redhat.com
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] qcow2: Remove FIXME comment,
	already fixed
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
X-List-Received-Date: Tue, 25 Mar 2014 12:47:59 -0000

On Mon, Mar 24, 2014 at 02:06:15PM +0800, Deepak Kathayat wrote:
> 
> Signed-off-by: Deepak Kathayat <deepak.mk17@gmail.com>
> ---
>  block/qcow2.h |    1 -
>  1 file changed, 1 deletion(-)

Thanks, applied to my block-next tree:
https://github.com/stefanha/qemu/commits/block-next

Stefan

