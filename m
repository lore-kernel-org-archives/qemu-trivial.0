Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YxwQ3-0001Xy-B8
	for mharc-qemu-trivial@gnu.org; Thu, 28 May 2015 07:56:15 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53666)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YxwPx-0001PA-Qs
	for qemu-trivial@nongnu.org; Thu, 28 May 2015 07:56:13 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YxwPt-0006nQ-Ue
	for qemu-trivial@nongnu.org; Thu, 28 May 2015 07:56:09 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:43537)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1YxwPg-0006gS-RM; Thu, 28 May 2015 07:55:53 -0400
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 13A1742715;
	Thu, 28 May 2015 14:55:51 +0300 (MSK)
Message-ID: <55670247.5040100@msgid.tls.msk.ru>
Date: Thu, 28 May 2015 14:55:51 +0300
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Icedove/31.6.0
MIME-Version: 1.0
To: Shannon Zhao <zhaoshenglong@huawei.com>, qemu-devel@nongnu.org
References: <1432811625-13392-1-git-send-email-zhaoshenglong@huawei.com>
	<1432811625-13392-2-git-send-email-zhaoshenglong@huawei.com>
In-Reply-To: <1432811625-13392-2-git-send-email-zhaoshenglong@huawei.com>
OpenPGP: id=804465C5
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, pbonzini@redhat.com, shannon.zhao@linaro.org
Subject: Re: [Qemu-trivial] [PATCH 1/4] hw/display/cg3.c: Fix memory leak
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
X-List-Received-Date: Thu, 28 May 2015 11:56:14 -0000

28.05.2015 14:13, Shannon Zhao wrote:
> From: Shannon Zhao <shannon.zhao@linaro.org>
> 
> Signed-off-by: Shannon Zhao <zhaoshenglong@huawei.com>
> Signed-off-by: Shannon Zhao <shannon.zhao@linaro.org>
> ---
>  hw/display/cg3.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/hw/display/cg3.c b/hw/display/cg3.c
> index 1e6ff2b..b86e5c0 100644
> --- a/hw/display/cg3.c
> +++ b/hw/display/cg3.c
> @@ -302,6 +302,7 @@ static void cg3_realizefn(DeviceState *dev, Error **errp)
>      if (fcode_filename) {
>          ret = load_image_targphys(fcode_filename, s->prom_addr,
>                                    FCODE_MAX_ROM_SIZE);
> +        g_free(fcode_filename);
>          if (ret < 0 || ret > FCODE_MAX_ROM_SIZE) {
>              error_report("cg3: could not load prom '%s'", CG3_ROM_FILE);
>          }

BTW, here, maybe it is better to rework error message too,
to include the actual filename it tried to load, not the
base name of it.

Is the error fatal?

Thanks,

/mjt

