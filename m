Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Z36nT-00055D-FN
	for mharc-qemu-trivial@gnu.org; Thu, 11 Jun 2015 14:01:47 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38068)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jsnow@redhat.com>) id 1Z36nN-0004vx-LE
	for qemu-trivial@nongnu.org; Thu, 11 Jun 2015 14:01:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <jsnow@redhat.com>) id 1Z36nM-0002jV-TM
	for qemu-trivial@nongnu.org; Thu, 11 Jun 2015 14:01:41 -0400
Received: from mx1.redhat.com ([209.132.183.28]:53185)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jsnow@redhat.com>)
	id 1Z36nI-0002ag-JZ; Thu, 11 Jun 2015 14:01:36 -0400
Received: from int-mx14.intmail.prod.int.phx2.redhat.com
	(int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	by mx1.redhat.com (Postfix) with ESMTPS id CE4218E6F0;
	Thu, 11 Jun 2015 18:01:35 +0000 (UTC)
Received: from scv.usersys.redhat.com (dhcp-17-29.bos.redhat.com [10.18.17.29])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t5BI1Z1S015288; Thu, 11 Jun 2015 14:01:35 -0400
Message-ID: <5579CCFE.5060200@redhat.com>
Date: Thu, 11 Jun 2015 14:01:34 -0400
From: John Snow <jsnow@redhat.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.7.0
MIME-Version: 1.0
To: Fam Zheng <famz@redhat.com>, qemu-devel@nongnu.org
References: <1432272908-8330-1-git-send-email-famz@redhat.com>
	<20150611084124.GC22459@ad.nay.redhat.com>
In-Reply-To: <20150611084124.GC22459@ad.nay.redhat.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, peter.maydell@linaro.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v2 0/2] Makefile: Generate
 tag files under $SRC_PATH
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
X-List-Received-Date: Thu, 11 Jun 2015 18:01:45 -0000



On 06/11/2015 04:41 AM, Fam Zheng wrote:
> On Fri, 05/22 13:35, Fam Zheng wrote:
> 
> Ping :)
> 
> Fam
> 
>>
>>
>> Fam Zheng (2):
>>   Makefile: Fix "make cscope TAGS"
>>   Makefile: Add "make ctags"
>>
>>  Makefile | 20 +++++++++++++++-----
>>  1 file changed, 15 insertions(+), 5 deletions(-)
>>
>> -- 
>> 2.4.1
>>
>>
> 

Looks good to me -- this has long been a major annoyance of mine when I
want to review code (and zip around) without trying to configure it first.

Reviewed-by: John Snow <jsnow@redhat.com>

