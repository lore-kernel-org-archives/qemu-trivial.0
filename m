Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YxwcN-0007zU-9E
	for mharc-qemu-trivial@gnu.org; Thu, 28 May 2015 08:08:59 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57383)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1YxwcH-0007z9-Tt
	for qemu-trivial@nongnu.org; Thu, 28 May 2015 08:08:57 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1YxwcE-0002ic-6s
	for qemu-trivial@nongnu.org; Thu, 28 May 2015 08:08:53 -0400
Received: from szxga01-in.huawei.com ([58.251.152.64]:43898)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>)
	id 1YxwcD-0002iI-I9; Thu, 28 May 2015 08:08:50 -0400
Received: from 172.24.2.119 (EHLO szxeml427-hub.china.huawei.com)
	([172.24.2.119])
	by szxrg01-dlp.huawei.com (MOS 4.3.7-GA FastPath queued)
	with ESMTP id COP97802; Thu, 28 May 2015 20:08:20 +0800 (CST)
Received: from [127.0.0.1] (10.177.16.142) by szxeml427-hub.china.huawei.com
	(10.82.67.182) with Microsoft SMTP Server id 14.3.158.1;
	Thu, 28 May 2015 20:08:03 +0800
Message-ID: <55670521.6090001@huawei.com>
Date: Thu, 28 May 2015 20:08:01 +0800
From: Shannon Zhao <zhaoshenglong@huawei.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1;
	rv:24.0) Gecko/20100101 Thunderbird/24.4.0
MIME-Version: 1.0
To: Michael Tokarev <mjt@tls.msk.ru>, <qemu-devel@nongnu.org>
References: <1432811625-13392-1-git-send-email-zhaoshenglong@huawei.com>
	<1432811625-13392-2-git-send-email-zhaoshenglong@huawei.com>
	<55670247.5040100@msgid.tls.msk.ru>
In-Reply-To: <55670247.5040100@msgid.tls.msk.ru>
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.177.16.142]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 58.251.152.64
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
X-List-Received-Date: Thu, 28 May 2015 12:08:58 -0000



On 2015/5/28 19:55, Michael Tokarev wrote:
> 28.05.2015 14:13, Shannon Zhao wrote:
>> > From: Shannon Zhao <shannon.zhao@linaro.org>
>> > 
>> > Signed-off-by: Shannon Zhao <zhaoshenglong@huawei.com>
>> > Signed-off-by: Shannon Zhao <shannon.zhao@linaro.org>
>> > ---
>> >  hw/display/cg3.c | 1 +
>> >  1 file changed, 1 insertion(+)
>> > 
>> > diff --git a/hw/display/cg3.c b/hw/display/cg3.c
>> > index 1e6ff2b..b86e5c0 100644
>> > --- a/hw/display/cg3.c
>> > +++ b/hw/display/cg3.c
>> > @@ -302,6 +302,7 @@ static void cg3_realizefn(DeviceState *dev, Error **errp)
>> >      if (fcode_filename) {
>> >          ret = load_image_targphys(fcode_filename, s->prom_addr,
>> >                                    FCODE_MAX_ROM_SIZE);
>> > +        g_free(fcode_filename);
>> >          if (ret < 0 || ret > FCODE_MAX_ROM_SIZE) {
>> >              error_report("cg3: could not load prom '%s'", CG3_ROM_FILE);
>> >          }
> BTW, here, maybe it is better to rework error message too,
> to include the actual filename it tried to load, not the
> base name of it.
> 

So respin this and other patches?

> Is the error fatal?

If CG3_ROM_FILE is removed, it happens.

-- 
Shannon


