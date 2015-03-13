Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YWP3X-0007mw-EP
	for mharc-qemu-trivial@gnu.org; Fri, 13 Mar 2015 08:51:11 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35567)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1YWP3V-0007mJ-2k
	for qemu-trivial@nongnu.org; Fri, 13 Mar 2015 08:51:09 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1YWP3R-0000wH-Mq
	for qemu-trivial@nongnu.org; Fri, 13 Mar 2015 08:51:09 -0400
Received: from mx1.redhat.com ([209.132.183.28]:39176)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>)
	id 1YWP3R-0000w5-FH; Fri, 13 Mar 2015 08:51:05 -0400
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id t2DCotHd015284
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=FAIL); Fri, 13 Mar 2015 08:50:55 -0400
Received: from [10.36.112.55] (ovpn-112-55.ams2.redhat.com [10.36.112.55])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t2DComeD019463
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NO);
	Fri, 13 Mar 2015 08:50:50 -0400
Message-ID: <5502DD26.6070401@redhat.com>
Date: Fri, 13 Mar 2015 13:50:46 +0100
From: Paolo Bonzini <pbonzini@redhat.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.5.0
MIME-Version: 1.0
To: Shannon Zhao <zhaoshenglong@huawei.com>, qemu-devel@nongnu.org
References: <1426244956-5316-1-git-send-email-zhaoshenglong@huawei.com>
In-Reply-To: <1426244956-5316-1-git-send-email-zhaoshenglong@huawei.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: peter.maydell@linaro.org, hangaohuai@huawei.com, qemu-trivial@nongnu.org,
	mjt@tls.msk.ru, peter.huangpeng@huawei.com,
	aneesh.kumar@linux.vnet.ibm.com, shannon.zhao@linaro.org
Subject: Re: [Qemu-trivial] [PATCH] hw/9pfs/virtio-9p-proxy: Fix possible
	overflow
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
X-List-Received-Date: Fri, 13 Mar 2015 12:51:10 -0000



On 13/03/2015 12:09, Shannon Zhao wrote:
> +    g_assert(strlen(path) < sizeof(helper.sun_path));

Ok.

>      sockfd = socket(AF_UNIX, SOCK_STREAM, 0);
>      if (sockfd < 0) {
>          fprintf(stderr, "failed to create socket: %s\n", strerror(errno));
>          return -1;
>      }
> -    strcpy(helper.sun_path, path);
> +    strncpy(helper.sun_path, path, sizeof(helper.sun_path));

strcpy is okay here.  strncpy makes people think of what happens if
strlen(path) == sizeof(helper.sun_path).  While this cannot happen here
because of the assertion, the function should still be used with care.

Paolo

