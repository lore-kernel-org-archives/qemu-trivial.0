Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UVgO5-0003NI-Kb
	for mharc-qemu-trivial@gnu.org; Fri, 26 Apr 2013 07:00:21 -0400
Received: from eggs.gnu.org ([208.118.235.92]:37791)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1UVgNy-0003LG-6u
	for qemu-trivial@nongnu.org; Fri, 26 Apr 2013 07:00:19 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1UVgNw-0002mG-56
	for qemu-trivial@nongnu.org; Fri, 26 Apr 2013 07:00:14 -0400
Received: from mail-bk0-x236.google.com ([2a00:1450:4008:c01::236]:35417)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1UVgNv-0002lu-UO
	for qemu-trivial@nongnu.org; Fri, 26 Apr 2013 07:00:12 -0400
Received: by mail-bk0-f54.google.com with SMTP id q11so1707232bkw.13
	for <qemu-trivial@nongnu.org>; Fri, 26 Apr 2013 04:00:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=zPIm24ErfJTDVQ8sDglZH0sWp6zqg9lvQ6HpYhMjTyQ=;
	b=BRUb73LjIISpsywA5niUw8ABUTYludoz5X4YLE0iUFtfj/stIOj2QVcoMiLdH7BOkG
	MqcPOJqz5U2aTo23uErGZ3NwJS9zIBkvvqmDjhqSS5KOnAJMnBbBrwQNdD7POZKXjEI9
	qiQEUE0ZhkV6Fms20LkVa6vSew1kRDwD6ZERd1q5+EI3VJq+Ouqu5mg5wJkOtkxUyVsk
	gXHVIuV89lKmZJzURfgdhka4AG+fOb5o2g0m82944M4wGb1P6s/KvPEJmNtxfDYYsV0k
	MXOl4kTFWdfjuK1Z9a9UIbWgvYc67SbfWP7bH3lgdkRlwVWM1gAxmFE7PAwzoJ36UyHm
	XAdg==
X-Received: by 10.205.116.131 with SMTP id fi3mr18167153bkc.58.1366974010955; 
	Fri, 26 Apr 2013 04:00:10 -0700 (PDT)
Received: from localhost ([2a02:810d:ec0:195:933:b278:833c:e7be])
	by mx.google.com with ESMTPSA id f14sm2986832bky.16.2013.04.26.04.00.09
	for <multiple recipients>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Fri, 26 Apr 2013 04:00:10 -0700 (PDT)
Date: Fri, 26 Apr 2013 13:00:08 +0200
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Ed Maste <emaste@freebsd.org>
Message-ID: <20130426110008.GB28115@stefanha-thinkpad.hitronhub.home>
References: <1366911508-11078-1-git-send-email-emaste@freebsd.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1366911508-11078-1-git-send-email-emaste@freebsd.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a00:1450:4008:c01::236
Cc: qemu-trivial@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH] Fix compilation without CONFIG_VHOST_SCSI
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
X-List-Received-Date: Fri, 26 Apr 2013 11:00:19 -0000

On Thu, Apr 25, 2013 at 01:38:28PM -0400, Ed Maste wrote:
> 
> Signed-off-by: Ed Maste <emaste@freebsd.org>
> ---
>  hw/s390x/s390-virtio-bus.c | 2 ++
>  hw/s390x/virtio-ccw.c      | 2 ++
>  hw/s390x/virtio-ccw.h      | 2 ++
>  3 files changed, 6 insertions(+)

Thanks, applied to the trivial patches tree:
https://github.com/stefanha/qemu/commits/trivial-patches

Stefan

