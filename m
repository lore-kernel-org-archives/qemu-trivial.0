Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WTtwf-0007Eu-6h
	for mharc-qemu-trivial@gnu.org; Sat, 29 Mar 2014 10:09:13 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35326)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mreitz@redhat.com>) id 1WTfEm-00014f-FF
	for qemu-trivial@nongnu.org; Fri, 28 Mar 2014 18:27:02 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mreitz@redhat.com>) id 1WTfEg-0003bg-9Y
	for qemu-trivial@nongnu.org; Fri, 28 Mar 2014 18:26:56 -0400
Received: from mx1.redhat.com ([209.132.183.28]:48895)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mreitz@redhat.com>)
	id 1WTfEg-0003bS-13; Fri, 28 Mar 2014 18:26:50 -0400
Received: from int-mx12.intmail.prod.int.phx2.redhat.com
	(int-mx12.intmail.prod.int.phx2.redhat.com [10.5.11.25])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id s2SMQkxL023252
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Fri, 28 Mar 2014 18:26:47 -0400
Received: from [10.36.116.21] (ovpn-116-21.ams2.redhat.com [10.36.116.21])
	by int-mx12.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id s2SMQhG7009687
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NO);
	Fri, 28 Mar 2014 18:26:44 -0400
Message-ID: <5335F722.8060008@redhat.com>
Date: Fri, 28 Mar 2014 23:26:42 +0100
From: Max Reitz <mreitz@redhat.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.4.0
MIME-Version: 1.0
To: Prasad Joshi <prasadjoshi.linux@gmail.com>
References: <1396028338-3810-1-git-send-email-prasadjoshi.linux@gmail.com>
In-Reply-To: <1396028338-3810-1-git-send-email-prasadjoshi.linux@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.25
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
X-Mailman-Approved-At: Sat, 29 Mar 2014 10:09:11 -0400
Cc: qemu-trivial@nongnu.org, kwolf@redhat.com, qemu-devel@nongnu.org,
	stefanha@redhat.com
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] qcow2: fix two memory leaks
 in qcow2_open error code path
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
X-List-Received-Date: Fri, 28 Mar 2014 22:27:02 -0000

On 28.03.2014 18:38, Prasad Joshi wrote:
> Signed-off-by: Prasad Joshi <prasadjoshi.linux@gmail.com>
> ---
>   block/qcow2.c | 4 ++++
>   1 file changed, 4 insertions(+)
>
> diff --git a/block/qcow2.c b/block/qcow2.c
> index b9dc960..10eccf9 100644
> --- a/block/qcow2.c
> +++ b/block/qcow2.c
> @@ -506,6 +506,7 @@ static int qcow2_open(BlockDriverState *bs, QDict *options, int flags,
>                                      s->incompatible_features &
>                                      ~QCOW2_INCOMPAT_MASK);
>           ret = -ENOTSUP;
> +        g_free(feature_table);
>           goto fail;
>       }
>   
> @@ -745,6 +746,9 @@ static int qcow2_open(BlockDriverState *bs, QDict *options, int flags,
>       if (s->l2_table_cache) {
>           qcow2_cache_destroy(bs, s->l2_table_cache);
>       }
> +    if (s->refcount_block_cache) {
> +        qcow2_cache_destroy(bs, s->refcount_block_cache);
> +    }
>       g_free(s->cluster_cache);
>       qemu_vfree(s->cluster_data);
>       return ret;

Reviewed-by: Max Reitz <mreitz@redhat.com>

