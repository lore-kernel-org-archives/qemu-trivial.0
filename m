Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YWiyu-0005yh-I7
	for mharc-qemu-trivial@gnu.org; Sat, 14 Mar 2015 06:07:44 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52709)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1YWiys-0005wF-8v
	for qemu-trivial@nongnu.org; Sat, 14 Mar 2015 06:07:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1YWiyr-0002c3-Cd
	for qemu-trivial@nongnu.org; Sat, 14 Mar 2015 06:07:42 -0400
Received: from v220110690675601.yourvserver.net ([37.221.199.173]:45397)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>)
	id 1YWiyn-0002bC-0V; Sat, 14 Mar 2015 06:07:37 -0400
Received: from localhost (v220110690675601.yourvserver.net.local [127.0.0.1])
	by v220110690675601.yourvserver.net (Postfix) with ESMTP id
	3D9CD11810A5; Sat, 14 Mar 2015 11:07:36 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at weilnetz.de
Received: from v220110690675601.yourvserver.net ([127.0.0.1])
	by localhost (v220110690675601.yourvserver.net [127.0.0.1])
	(amavisd-new, port 10024)
	with ESMTP id V_FxiROslKsg; Sat, 14 Mar 2015 11:07:33 +0100 (CET)
Received: from [192.168.178.24] (p54AC89A6.dip0.t-ipconnect.de
	[84.172.137.166])
	by v220110690675601.yourvserver.net (Postfix) with ESMTPSA id
	A5EC11180F74; Sat, 14 Mar 2015 11:07:33 +0100 (CET)
Message-ID: <55040865.8050908@weilnetz.de>
Date: Sat, 14 Mar 2015 11:07:33 +0100
From: Stefan Weil <sw@weilnetz.de>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Icedove/31.5.0
MIME-Version: 1.0
To: Shannon Zhao <zhaoshenglong@huawei.com>, qemu-devel@nongnu.org
References: <1426326454-7216-1-git-send-email-zhaoshenglong@huawei.com>
In-Reply-To: <1426326454-7216-1-git-send-email-zhaoshenglong@huawei.com>
Content-Type: text/plain; charset=iso-8859-15; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 37.221.199.173
Cc: peter.maydell@linaro.org, hangaohuai@huawei.com, qemu-trivial@nongnu.org,
	mjt@tls.msk.ru, peter.huangpeng@huawei.com,
	shannon.zhao@linaro.org, pbonzini@redhat.com
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] hw/bt/sdp: Fix resource
	leak detect by coverity
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
X-List-Received-Date: Sat, 14 Mar 2015 10:07:43 -0000

Am 14.03.2015 um 10:47 schrieb Shannon Zhao:
> Free data in function sdp_attr_write after use.
>
> Signed-off-by: Shannon Zhao <zhaoshenglong@huawei.com>
> Signed-off-by: Shannon Zhao <shannon.zhao@linaro.org>
> ---
>      For minimum modification, just add a variable to record the data.
> ---
>   hw/bt/sdp.c | 5 +++--
>   1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/hw/bt/sdp.c b/hw/bt/sdp.c
> index 218e075..8be0d14 100644
> --- a/hw/bt/sdp.c
> +++ b/hw/bt/sdp.c
> @@ -698,7 +698,7 @@ static void sdp_service_record_build(struct sdp_service_record_s *record,
>                   struct sdp_def_service_s *def, int handle)
>   {
>       int len = 0;
> -    uint8_t *data;
> +    uint8_t *data, *pt;
>       int *uuid;
>   
>       record->uuids = 0;
> @@ -712,7 +712,7 @@ static void sdp_service_record_build(struct sdp_service_record_s *record,
>               g_malloc0(record->attributes * sizeof(*record->attribute_list));
>       record->uuid =
>               g_malloc0(record->uuids * sizeof(*record->uuid));
> -    data = g_malloc(len);
> +    pt = data = g_malloc(len);
>   
>       record->attributes = 0;
>       uuid = record->uuid;
> @@ -735,6 +735,7 @@ static void sdp_service_record_build(struct sdp_service_record_s *record,
>           record->attribute_list[record->attributes ++].len = len;
>           data += len;
>       }
> +    g_free(pt);
>   
>       /* Sort the attribute list by the AttributeID */
>       qsort(record->attribute_list, record->attributes,

This fixes the memory leak, but I still don't understand what is done here.
data is allocated, then filled with values, now it is also deallocated. 
But I'm
missing the part where all those data is used.

Stefan

