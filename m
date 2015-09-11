Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZaJHT-0006UV-K0
	for mharc-qemu-trivial@gnu.org; Fri, 11 Sep 2015 04:01:59 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47680)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1ZaJHQ-0006Ql-Vr
	for qemu-trivial@nongnu.org; Fri, 11 Sep 2015 04:01:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1ZaJHQ-0008IN-1n
	for qemu-trivial@nongnu.org; Fri, 11 Sep 2015 04:01:56 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:50708)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1ZaJHK-0008Fv-LV; Fri, 11 Sep 2015 04:01:50 -0400
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 051CF4141D;
	Fri, 11 Sep 2015 11:01:50 +0300 (MSK)
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with ESMTP id E3F77A52;
	Fri, 11 Sep 2015 11:01:49 +0300 (MSK)
Message-ID: <55F28A6D.7020201@msgid.tls.msk.ru>
Date: Fri, 11 Sep 2015 11:01:49 +0300
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Icedove/31.8.0
MIME-Version: 1.0
To: shannon.zhao@linaro.org, qemu-devel@nongnu.org
References: <1431397521-2316-1-git-send-email-shannon.zhao@linaro.org>
	<1431397521-2316-3-git-send-email-shannon.zhao@linaro.org>
In-Reply-To: <1431397521-2316-3-git-send-email-shannon.zhao@linaro.org>
OpenPGP: id=804465C5
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: peter.maydell@linaro.org, hangaohuai@huawei.com, qemu-trivial@nongnu.org,
	peter.huangpeng@huawei.com, zhaoshenglong@huawei.com,
	christoffer.dall@linaro.org
Subject: Re: [Qemu-trivial] [PATCH 2/6] hw/virtio/virtio-balloon: Remove
 meaningless blank Property
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
X-List-Received-Date: Fri, 11 Sep 2015 08:01:58 -0000

12.05.2015 05:25, shannon.zhao@linaro.org wrote:
> From: Shannon Zhao <shannon.zhao@linaro.org>
> 
> Signed-off-by: Shannon Zhao <zhaoshenglong@huawei.com>
> Signed-off-by: Shannon Zhao <shannon.zhao@linaro.org>
> ---
>  hw/virtio/virtio-balloon.c | 5 -----
>  1 file changed, 5 deletions(-)
> 
> diff --git a/hw/virtio/virtio-balloon.c b/hw/virtio/virtio-balloon.c
> index 484c3c3..a3f5709 100644
> --- a/hw/virtio/virtio-balloon.c
> +++ b/hw/virtio/virtio-balloon.c
> @@ -417,16 +417,11 @@ static void virtio_balloon_device_unrealize(DeviceState *dev, Error **errp)
>      virtio_cleanup(vdev);
>  }
>  
> -static Property virtio_balloon_properties[] = {
> -    DEFINE_PROP_END_OF_LIST(),
> -};

Current balloon properties list isnt' empty, so this patch isn't needed anymore.

/mjt

