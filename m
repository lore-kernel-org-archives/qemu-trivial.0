Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WVxyZ-0002G5-5K
	for mharc-qemu-trivial@gnu.org; Fri, 04 Apr 2014 02:51:43 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38748)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mprivozn@redhat.com>) id 1WVxyR-00025x-4b
	for qemu-trivial@nongnu.org; Fri, 04 Apr 2014 02:51:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mprivozn@redhat.com>) id 1WVxyJ-00067U-35
	for qemu-trivial@nongnu.org; Fri, 04 Apr 2014 02:51:35 -0400
Received: from mx1.redhat.com ([209.132.183.28]:23154)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mprivozn@redhat.com>)
	id 1WVxyI-000678-SJ; Fri, 04 Apr 2014 02:51:27 -0400
Received: from int-mx01.intmail.prod.int.phx2.redhat.com
	(int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id s346pPfW020924
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Fri, 4 Apr 2014 02:51:25 -0400
Received: from [10.34.26.104] (dhcp-26-104.brq.redhat.com [10.34.26.104])
	by int-mx01.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id s346pMYB009722; Fri, 4 Apr 2014 02:51:23 -0400
Message-ID: <533E5669.4090709@redhat.com>
Date: Fri, 04 Apr 2014 08:51:21 +0200
From: Michal Privoznik <mprivozn@redhat.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.4.0
MIME-Version: 1.0
To: Amos Kong <akong@redhat.com>, qemu-trivial@nongnu.org,
	qemu-devel@nongnu.org
References: <1396572808-21535-1-git-send-email-akong@redhat.com>
In-Reply-To: <1396572808-21535-1-git-send-email-akong@redhat.com>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.67 on 10.5.11.11
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: mjt@tls.msk.ru, lersek@redhat.com
Subject: Re: [Qemu-trivial] [PATCH] qga: trivial fix for unclear document of
	guest-set-time
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
X-List-Received-Date: Fri, 04 Apr 2014 06:51:41 -0000

On 04.04.2014 02:53, Amos Kong wrote:
> We mixedly used "guest time", "system time", "hardware time", "RTC"
> in document, it's unclear.
>
> This patch just added two remarks of RTC and replace two "guest time"
> by "guest's system time".
>
> Signed-off-by: Amos Kong <akong@redhat.com>

Reviewed-by: Michal Privoznik <mprivozn@redhat.com>

Michal

