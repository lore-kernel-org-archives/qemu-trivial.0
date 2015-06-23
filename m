Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Z7IvL-00023j-VR
	for mharc-qemu-trivial@gnu.org; Tue, 23 Jun 2015 03:47:15 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54914)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1Z7IvJ-000207-Ne
	for qemu-trivial@nongnu.org; Tue, 23 Jun 2015 03:47:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1Z7IvE-000837-1B
	for qemu-trivial@nongnu.org; Tue, 23 Jun 2015 03:47:13 -0400
Received: from mail-wi0-x22a.google.com ([2a00:1450:400c:c05::22a]:36799)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>)
	id 1Z7IvD-00082v-Qw; Tue, 23 Jun 2015 03:47:07 -0400
Received: by wicnd19 with SMTP id nd19so97608914wic.1;
	Tue, 23 Jun 2015 00:47:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=E7+b6ZLfMMHQDof3KKvhri/0fF3lPLgNJx+wF4f2sJ4=;
	b=b0Q/xA95h2TNCB398G5fvV+sOprA/1RQjtZJ1Y78U0oCmvOfZyEeboUG0gr/EqxBOl
	arwAdaBASoRbiey7e2Z671dUGR9KcoqsneOblp3wCa7ytZ+wZ7p/2Wi6j/EJzVypqOBi
	tQ2Hg7cv6XPEqw8SqYw5hD6z4xGpwT7WbN9Lx15mzA5J2UT7k/srZ4NkpwCGHS58lyp5
	9xJWFc78S4SgwW4SkOZqU2juvCHG0WNZIWPjWuJfJ1h4l6Wm7HiiN9AB+YqqiKx2AmUF
	qS4R7cg0JXBTKS8LEYuSZ53eS2EsWuf5H43IKhVMDOR0ccm1qYLaIuhm4FN30x7Z0AiQ
	xLTQ==
X-Received: by 10.180.109.136 with SMTP id hs8mr839247wib.73.1435045627166;
	Tue, 23 Jun 2015 00:47:07 -0700 (PDT)
Received: from [192.168.10.165] (dynamic-adsl-94-39-129-53.clienti.tiscali.it.
	[94.39.129.53])
	by mx.google.com with ESMTPSA id ev8sm18056331wjb.8.2015.06.23.00.47.05
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 23 Jun 2015 00:47:06 -0700 (PDT)
Sender: Paolo Bonzini <paolo.bonzini@gmail.com>
Message-ID: <55890EF8.4090608@redhat.com>
Date: Tue, 23 Jun 2015 09:47:04 +0200
From: Paolo Bonzini <pbonzini@redhat.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.6.0
MIME-Version: 1.0
To: arei.gonglei@huawei.com, qemu-devel@nongnu.org
References: <1435021348-9156-1-git-send-email-arei.gonglei@huawei.com>
In-Reply-To: <1435021348-9156-1-git-send-email-arei.gonglei@huawei.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a00:1450:400c:c05::22a
Cc: qemu-trivial@nongnu.org, amit.shah@redhat.com, mrhines@us.ibm.com,
	quintela@redhat.com
Subject: Re: [Qemu-trivial] [PATCH] rdma: fix memory leak
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
X-List-Received-Date: Tue, 23 Jun 2015 07:47:14 -0000



On 23/06/2015 03:02, arei.gonglei@huawei.com wrote:
> From: Gonglei <arei.gonglei@huawei.com>
> 
> Variable "r" going out of scope leaks the storage
> it points to in line 3268.
> 
> Signed-off-by: Gonglei <arei.gonglei@huawei.com>
> ---
>  migration/rdma.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/migration/rdma.c b/migration/rdma.c
> index cf5de7e..de80860 100644
> --- a/migration/rdma.c
> +++ b/migration/rdma.c
> @@ -3262,12 +3262,13 @@ static const QEMUFileOps rdma_write_ops = {
>  
>  static void *qemu_fopen_rdma(RDMAContext *rdma, const char *mode)
>  {
> -    QEMUFileRDMA *r = g_malloc0(sizeof(QEMUFileRDMA));
> +    QEMUFileRDMA *r = NULL;

No need for the NULL initialization.

Paolo
>  
>      if (qemu_file_mode_is_not_valid(mode)) {
>          return NULL;
>      }
>  
> +    r = g_malloc0(sizeof(QEMUFileRDMA));
>      r->rdma = rdma;
>  
>      if (mode[0] == 'w') {
> 

