Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZuDxr-0006XY-JR
	for mharc-qemu-trivial@gnu.org; Thu, 05 Nov 2015 01:24:03 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45509)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <caoj.fnst@cn.fujitsu.com>) id 1ZuDxo-0006Vx-BC
	for qemu-trivial@nongnu.org; Thu, 05 Nov 2015 01:24:01 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <caoj.fnst@cn.fujitsu.com>) id 1ZuDxj-0007eq-Qj
	for qemu-trivial@nongnu.org; Thu, 05 Nov 2015 01:24:00 -0500
Received: from [59.151.112.132] (port=62357 helo=heian.cn.fujitsu.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <caoj.fnst@cn.fujitsu.com>)
	id 1ZuDxi-0007bw-N2; Thu, 05 Nov 2015 01:23:55 -0500
X-IronPort-AV: E=Sophos;i="5.20,242,1444665600"; 
   d="scan'208";a="121218"
Received: from unknown (HELO edo.cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 05 Nov 2015 14:23:35 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (localhost.localdomain
	[127.0.0.1])
	by edo.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id tA56N9pu019014;
	Thu, 5 Nov 2015 14:23:09 +0800
Received: from [10.167.226.57] (10.167.226.57) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Thu, 5 Nov 2015 14:23:46 +0800
To: <qemu-devel@nongnu.org>
References: <1446700754-16219-1-git-send-email-caoj.fnst@cn.fujitsu.com>
From: Cao jin <caoj.fnst@cn.fujitsu.com>
Message-ID: <563AF601.20104@cn.fujitsu.com>
Date: Thu, 5 Nov 2015 14:24:01 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.1.0
MIME-Version: 1.0
In-Reply-To: <1446700754-16219-1-git-send-email-caoj.fnst@cn.fujitsu.com>
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.167.226.57]
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 59.151.112.132
Cc: qemu-trivial@nongnu.org, afaerber@suse.de
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] object_new_with_type:
	remove redundant code
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
X-List-Received-Date: Thu, 05 Nov 2015 06:24:01 -0000

sorry for this, I am wrong at removing type_initialize.
please forget it

On 11/05/2015 01:19 PM, Cao jin wrote:
> g_assert & type_initialize are called in object_initialize_with_type
>
> Signed-off-by: Cao jin <caoj.fnst@cn.fujitsu.com>
> ---
>   qom/object.c | 3 ---
>   1 file changed, 3 deletions(-)
>
> diff --git a/qom/object.c b/qom/object.c
> index fc6e161..43ac2dd 100644
> --- a/qom/object.c
> +++ b/qom/object.c
> @@ -423,9 +423,6 @@ Object *object_new_with_type(Type type)
>   {
>       Object *obj;
>
> -    g_assert(type != NULL);
> -    type_initialize(type);
> -
>       obj = g_malloc(type->instance_size);
>       object_initialize_with_type(obj, type->instance_size, type);
>       obj->free = g_free;
>

-- 
Yours Sincerely,

Cao Jin

