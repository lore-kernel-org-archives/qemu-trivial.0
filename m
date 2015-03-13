Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YWP5q-0002xt-94
	for mharc-qemu-trivial@gnu.org; Fri, 13 Mar 2015 08:53:34 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36546)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1YWP5o-0002vP-2J
	for qemu-trivial@nongnu.org; Fri, 13 Mar 2015 08:53:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1YWP5i-0001jQ-29
	for qemu-trivial@nongnu.org; Fri, 13 Mar 2015 08:53:32 -0400
Received: from mx1.redhat.com ([209.132.183.28]:56081)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>)
	id 1YWP5h-0001jE-Ql; Fri, 13 Mar 2015 08:53:25 -0400
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id t2DCrL7G001276
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=FAIL); Fri, 13 Mar 2015 08:53:21 -0400
Received: from [10.36.112.55] (ovpn-112-55.ams2.redhat.com [10.36.112.55])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t2DCrGIg007540
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NO);
	Fri, 13 Mar 2015 08:53:18 -0400
Message-ID: <5502DDBB.8070002@redhat.com>
Date: Fri, 13 Mar 2015 13:53:15 +0100
From: Paolo Bonzini <pbonzini@redhat.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.5.0
MIME-Version: 1.0
To: Shannon Zhao <zhaoshenglong@huawei.com>, qemu-devel@nongnu.org
References: <1426172243-7830-1-git-send-email-pbonzini@redhat.com>
	<550272F4.30309@huawei.com>
In-Reply-To: <550272F4.30309@huawei.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, Hangaohuai <hangaohuai@huawei.com>,
	"Gonglei \(Arei\)" <arei.gonglei@huawei.com>,
	"Huangpeng \(Peter\)" <peter.huangpeng@huawei.com>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] vl: fix resource leak with
	monitor_fdset_add_fd
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
X-List-Received-Date: Fri, 13 Mar 2015 12:53:33 -0000



On 13/03/2015 06:17, Shannon Zhao wrote:
>> > -    monitor_fdset_add_fd(dupfd, true, fdset_id, fd_opaque ? true : false,
>> > -                         fd_opaque, NULL);
>> > +    fdinfo = monitor_fdset_add_fd(dupfd, true, fdset_id, fd_opaque ? true : false,
>> > +                                  fd_opaque, NULL);
>> > +    g_free(fdinfo);
>> >  
>> >      return 0;
>> >  }
>> > 
> Hi Paolo,
> 
> Not about the resource leak, but I think we should check fdinfo == NULL and return -1.
> Then when error occurs, qemu will exit. Besides we should pass a meaningful errp not NULL.
> So qemu can report the error reason. Right?

It cannot fail here, so another possibility could be to pass &error_abort.

Paolo

