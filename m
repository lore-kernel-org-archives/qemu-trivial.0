Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1aoxJl-0003p2-4v
	for mharc-qemu-trivial@gnu.org; Sat, 09 Apr 2016 14:09:09 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39922)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanb@linux.vnet.ibm.com>) id 1aoxJi-0003k3-98
	for qemu-trivial@nongnu.org; Sat, 09 Apr 2016 14:09:07 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanb@linux.vnet.ibm.com>) id 1aoxJf-0007GT-GU
	for qemu-trivial@nongnu.org; Sat, 09 Apr 2016 14:09:06 -0400
Received: from e19.ny.us.ibm.com ([129.33.205.209]:49194)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanb@linux.vnet.ibm.com>) id 1aoxJf-0007GD-BT
	for qemu-trivial@nongnu.org; Sat, 09 Apr 2016 14:09:03 -0400
Received: from localhost
	by e19.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
	Violators will be prosecuted
	for <qemu-trivial@nongnu.org> from <stefanb@linux.vnet.ibm.com>;
	Sat, 9 Apr 2016 14:09:01 -0400
Received: from d01dlp02.pok.ibm.com (9.56.250.167)
	by e19.ny.us.ibm.com (146.89.104.206) with IBM ESMTP SMTP Gateway:
	Authorized Use Only! Violators will be prosecuted; 
	Sat, 9 Apr 2016 14:08:59 -0400
X-IBM-Helo: d01dlp02.pok.ibm.com
X-IBM-MailFrom: stefanb@linux.vnet.ibm.com
X-IBM-RcptTo: qemu-devel@nongnu.org;qemu-trivial@nongnu.org
Received: from b01cxnp23034.gho.pok.ibm.com (b01cxnp23034.gho.pok.ibm.com
	[9.57.198.29])
	by d01dlp02.pok.ibm.com (Postfix) with ESMTP id 9A0226E8040;
	Sat,  9 Apr 2016 13:55:47 -0400 (EDT)
Received: from d01av05.pok.ibm.com (d01av05.pok.ibm.com [9.56.224.195])
	by b01cxnp23034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
	u39I8wwo40239170; Sat, 9 Apr 2016 18:08:58 GMT
Received: from d01av05.pok.ibm.com (localhost [127.0.0.1])
	by d01av05.pok.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
	u39I35QN018904; Sat, 9 Apr 2016 14:03:05 -0400
Received: from sbct-3.watson.ibm.com (sbct-3.watson.ibm.com [9.2.141.158])
	by d01av05.pok.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with ESMTP id
	u39I35HR018898; Sat, 9 Apr 2016 14:03:05 -0400
To: Stefan Berger <stefanb@us.ibm.com>, qemu-trivial@nongnu.org,
	qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
	"Michael S. Tsirkin" <mst@redhat.com>
References: <1459902110-9856-1-git-send-email-stefanb@us.ibm.com>
From: Stefan Berger <stefanb@linux.vnet.ibm.com>
Message-ID: <57094539.6020203@linux.vnet.ibm.com>
Date: Sat, 9 Apr 2016 14:08:57 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.7.1
MIME-Version: 1.0
In-Reply-To: <1459902110-9856-1-git-send-email-stefanb@us.ibm.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-MML: disable
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 16040918-0057-0000-0000-000003FDE195
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 129.33.205.209
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v2] tpm: Fix write to file
 descriptor function
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial/>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Sat, 09 Apr 2016 18:09:07 -0000

On 04/05/2016 08:21 PM, Stefan Berger wrote:
> Fix a bug introduced in commit 46f296c while moving send_all to the
> tpm_passthrough code. Fix the name of the variable used in the loop.

Would someone please pick up this fix?

> Signed-off-by: Stefan Berger <stefanb@linux.vnet.ibm.com>
> ---
>   hw/tpm/tpm_passthrough.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/hw/tpm/tpm_passthrough.c b/hw/tpm/tpm_passthrough.c
> index e98efb7..e88c0d2 100644
> --- a/hw/tpm/tpm_passthrough.c
> +++ b/hw/tpm/tpm_passthrough.c
> @@ -86,7 +86,7 @@ static int tpm_passthrough_unix_write(int fd, const uint8_t *buf, uint32_t len)
>       int ret, remain;
>
>       remain = len;
> -    while (len > 0) {
> +    while (remain > 0) {
>           ret = write(fd, buf, remain);
>           if (ret < 0) {
>               if (errno != EINTR && errno != EAGAIN) {


