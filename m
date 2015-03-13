Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YWP3i-000831-Tb
	for mharc-qemu-trivial@gnu.org; Fri, 13 Mar 2015 08:51:23 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35609)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1YWP3h-000816-BE
	for qemu-trivial@nongnu.org; Fri, 13 Mar 2015 08:51:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1YWP3d-00010X-JO
	for qemu-trivial@nongnu.org; Fri, 13 Mar 2015 08:51:21 -0400
Received: from mx1.redhat.com ([209.132.183.28]:35841)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>)
	id 1YWP3d-0000z0-CQ; Fri, 13 Mar 2015 08:51:17 -0400
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id t2DCp96c010087
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=FAIL); Fri, 13 Mar 2015 08:51:09 -0400
Received: from [10.36.112.55] (ovpn-112-55.ams2.redhat.com [10.36.112.55])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t2DCp2wR005021
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NO);
	Fri, 13 Mar 2015 08:51:05 -0400
Message-ID: <5502DD35.60803@redhat.com>
Date: Fri, 13 Mar 2015 13:51:01 +0100
From: Paolo Bonzini <pbonzini@redhat.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.5.0
MIME-Version: 1.0
To: Shannon Zhao <zhaoshenglong@huawei.com>, qemu-devel@nongnu.org
References: <1426244997-11392-1-git-send-email-zhaoshenglong@huawei.com>
In-Reply-To: <1426244997-11392-1-git-send-email-zhaoshenglong@huawei.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: peter.maydell@linaro.org, hangaohuai@huawei.com, qemu-trivial@nongnu.org,
	mjt@tls.msk.ru, peter.huangpeng@huawei.com,
	aneesh.kumar@linux.vnet.ibm.com, shannon.zhao@linaro.org
Subject: Re: [Qemu-trivial] [PATCH] fsdev/virtfs-proxy-helper: Fix possible
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
X-List-Received-Date: Fri, 13 Mar 2015 12:51:22 -0000



On 13/03/2015 12:09, Shannon Zhao wrote:
> +    g_assert(strlen(path) < sizeof(proxy.sun_path));
>      sock = socket(AF_UNIX, SOCK_STREAM, 0);
>      if (sock < 0) {
>          do_perror("socket");
> @@ -748,7 +749,7 @@ static int proxy_socket(const char *path, uid_t uid, gid_t gid)
>      umask(7);
>  
>      proxy.sun_family = AF_UNIX;
> -    strcpy(proxy.sun_path, path);
> +    strncpy(proxy.sun_path, path, sizeof(proxy.sun_path));
>      if (bind(sock, (struct sockaddr *)&proxy,

Same as the other patch.

Paolo

