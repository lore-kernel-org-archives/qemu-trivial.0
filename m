Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Zn3hN-0008OL-23
	for mharc-qemu-trivial@gnu.org; Fri, 16 Oct 2015 08:01:25 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37931)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1Zn3hJ-0008KY-OR
	for qemu-trivial@nongnu.org; Fri, 16 Oct 2015 08:01:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1Zn3hG-0006MV-KA
	for qemu-trivial@nongnu.org; Fri, 16 Oct 2015 08:01:21 -0400
Received: from mail-wi0-x22d.google.com ([2a00:1450:400c:c05::22d]:37820)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1Zn3hG-0006M0-ER; Fri, 16 Oct 2015 08:01:18 -0400
Received: by wijq8 with SMTP id q8so7259451wij.0;
	Fri, 16 Oct 2015 05:01:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=Q13pUbVOR7iHt27t8qPNBeXKuThq/M96Kz1nPr9TGKw=;
	b=JILp44gkLx1jaj3kqhlO7HdWLOlYNkN39B588+5QKg1YDdEZzvONquoyeBcZlHva9+
	JxsBGJ7EqA0zwS+fwsAxFu1ml5vcmrpntATWvzwMMCtdr3D3bWwTDiUly8E+NgYJ18F7
	HnBMwHIFMT8c0JExDtmox+SP7T8yuNi3atdAj+6C6wGK+/jfzA2e7PxClXcX7rQjMMPB
	/U94h3kQKOzumQqMpLcTRwugaubq14xSxCIDkpByHTUtrO3aNGpPjwfbMYRrSSXFbk/m
	Lw+sdfK0FXe97/kecpCOd1bj+lr6BigAZYeBGo+3nOKeL2eFGQ7DExIGfHQOfLvn0GUZ
	0Bkw==
X-Received: by 10.194.110.37 with SMTP id hx5mr16776282wjb.149.1444996877613; 
	Fri, 16 Oct 2015 05:01:17 -0700 (PDT)
Received: from localhost (d86-33-9-173.cust.tele2.at. [86.33.9.173])
	by smtp.gmail.com with ESMTPSA id
	ee5sm22178731wjd.17.2015.10.16.05.01.16
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 16 Oct 2015 05:01:16 -0700 (PDT)
Date: Fri, 16 Oct 2015 14:01:15 +0200
From: Stefan Hajnoczi <stefanha@gmail.com>
To: zhanghailiang <zhang.zhanghailiang@huawei.com>
Message-ID: <20151016120115.GC10205@stefanha-thinkpad.redhat.com>
References: <1442227210-24604-1-git-send-email-zhang.zhanghailiang@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1442227210-24604-1-git-send-email-zhang.zhanghailiang@huawei.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a00:1450:400c:c05::22d
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org, mst@redhat.com
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] piix: fix resource leak
	reported by Coverity
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
X-List-Received-Date: Fri, 16 Oct 2015 12:01:22 -0000

On Mon, Sep 14, 2015 at 06:40:10PM +0800, zhanghailiang wrote:
> config_fd should be closed before return, or there will
> be a resource leak error.
> 
> Signed-off-by: zhanghailiang <zhang.zhanghailiang@huawei.com>
> ---
>  hw/pci-host/piix.c | 11 +++++++----
>  1 file changed, 7 insertions(+), 4 deletions(-)

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

