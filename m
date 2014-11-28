Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XuG02-0007Da-I2
	for mharc-qemu-trivial@gnu.org; Fri, 28 Nov 2014 02:29:54 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41263)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1XuFzw-000765-67
	for qemu-trivial@nongnu.org; Fri, 28 Nov 2014 02:29:52 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1XuFzr-0002T3-Bw
	for qemu-trivial@nongnu.org; Fri, 28 Nov 2014 02:29:48 -0500
Received: from mx1.redhat.com ([209.132.183.28]:40058)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>)
	id 1XuFzh-0002PZ-Bz; Fri, 28 Nov 2014 02:29:33 -0500
Received: from int-mx13.intmail.prod.int.phx2.redhat.com
	(int-mx13.intmail.prod.int.phx2.redhat.com [10.5.11.26])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id sAS7TPLi021446
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=FAIL); Fri, 28 Nov 2014 02:29:26 -0500
Received: from blackfin.pond.sub.org (ovpn-116-64.ams2.redhat.com
	[10.36.116.64])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id sAS7TN3J021998
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Fri, 28 Nov 2014 02:29:24 -0500
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id F35AF30411BA; Fri, 28 Nov 2014 08:29:22 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Gonglei <arei.gonglei@huawei.com>
References: <1415881027-8112-1-git-send-email-arei.gonglei@huawei.com>
	<1415881027-8112-3-git-send-email-arei.gonglei@huawei.com>
	<87h9xkkdxx.fsf@blackfin.pond.sub.org> <5477D530.7030101@huawei.com>
Date: Fri, 28 Nov 2014 08:29:22 +0100
In-Reply-To: <5477D530.7030101@huawei.com> (Gonglei's message of "Fri, 28 Nov
	2014 09:51:44 +0800")
Message-ID: <87lhmv9419.fsf@blackfin.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.3 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.26
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: "qemu-trivial@nongnu.org" <qemu-trivial@nongnu.org>,
	"aneesh.kumar@linux.vnet.ibm.com" <aneesh.kumar@linux.vnet.ibm.com>,
	"Huangpeng \(Peter\)" <peter.huangpeng@huawei.com>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 2/2] virtfs-proxy-helper:
	Fix handle leak to make Coverity happy
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
X-List-Received-Date: Fri, 28 Nov 2014 07:29:53 -0000

Gonglei <arei.gonglei@huawei.com> writes:

> On 2014/11/27 20:47, Markus Armbruster wrote:
>
>> <arei.gonglei@huawei.com> writes:
>> 
>>> From: Gonglei <arei.gonglei@huawei.com>
>>>
>>> Coverity report:
>>> (94) Event open_fn:  Returning handle opened by function "proxy_socket(char const *, uid_t, gid_t)". [details]
>>> (95) Event var_assign:  Assigning: "sock" = handle returned from "proxy_socket(sock_name, own_u, own_g)".
>>> (103) Event leaked_handle:  Handle variable "sock" going out of scope leaks the handle.
>>>
>>> Signed-off-by: Gonglei <arei.gonglei@huawei.com>
>>> ---
>>>  fsdev/virtfs-proxy-helper.c | 3 +++
>>>  1 file changed, 3 insertions(+)
>>>
>>> diff --git a/fsdev/virtfs-proxy-helper.c b/fsdev/virtfs-proxy-helper.c
>>> index c1da2d7..2d72def 100644
>>> --- a/fsdev/virtfs-proxy-helper.c
>>> +++ b/fsdev/virtfs-proxy-helper.c
>>> @@ -1150,6 +1150,9 @@ int main(int argc, char **argv)
>>>  
>>>      process_requests(sock);
>>>  error:
>>> +    if (sock_name && sock >= 0) {
>>> +        close(sock);
>>> +    }
>>>      do_log(LOG_INFO, "Done\n");
>>>      closelog();
>>>      return 0;
>> 
>> Why if sock_name?  What about sock gotten from -f?
>>
>
> Thanks for your review, Makus :)
>
>  
>
> Because only sock_name is non-NULL, the sock returned from
> "proxy_socket(sock_name, own_u, own_g)", then will leak fd.
> If sock gotten from -f, maybe the caller will free it IMO.

Since this is main(), the "caller" is the OS.  And yes, the OS closes
the -f file descriptor when main() returns, because it closes *all* file
descriptors.  Calling close() before return from main() is pointless,
unless you check for errors.

Unfortunately, Coverity doesn't understand this.  Calling close() in
main() suppresses its bogus defect report.

>> If sock >= 0 is pointless, too, but needed to hush up Coverity.
>
> You mean do not check sock_name is NULL or not?

Yes, unless it causes another bogus Coverity defect.

Or simply mark the defect as invalid and move on without patching the
code.

