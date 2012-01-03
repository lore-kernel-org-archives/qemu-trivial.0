Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Ri32M-0007IO-L5
	for mharc-qemu-trivial@gnu.org; Tue, 03 Jan 2012 07:00:14 -0500
Received: from eggs.gnu.org ([140.186.70.92]:50651)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1Ri32E-0006sB-M9
	for qemu-trivial@nongnu.org; Tue, 03 Jan 2012 07:00:12 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1Ri32A-00073E-3k
	for qemu-trivial@nongnu.org; Tue, 03 Jan 2012 07:00:06 -0500
Received: from mx1.redhat.com ([209.132.183.28]:55583)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>)
	id 1Ri327-00072d-Ty; Tue, 03 Jan 2012 07:00:00 -0500
Received: from int-mx12.intmail.prod.int.phx2.redhat.com
	(int-mx12.intmail.prod.int.phx2.redhat.com [10.5.11.25])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id q03BxvRw031552
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Tue, 3 Jan 2012 06:59:57 -0500
Received: from yakj.usersys.redhat.com (ovpn-112-16.ams2.redhat.com
	[10.36.112.16])
	by int-mx12.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id q03Bxt25024936; Tue, 3 Jan 2012 06:59:56 -0500
Message-ID: <4F02EDBA.8090808@redhat.com>
Date: Tue, 03 Jan 2012 12:59:54 +0100
From: Paolo Bonzini <pbonzini@redhat.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:9.0) Gecko/20111222 Thunderbird/9.0
MIME-Version: 1.0
To: Stefan Hajnoczi <stefanha@gmail.com>
References: <1325527237-24146-1-git-send-email-pbonzini@redhat.com>
	<1325527237-24146-2-git-send-email-pbonzini@redhat.com>
	<20120103115448.GB28826@stefanha-thinkpad.localdomain>
In-Reply-To: <20120103115448.GB28826@stefanha-thinkpad.localdomain>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.25
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 3)
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 1/8] notifier: switch to
	QLIST
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
X-List-Received-Date: Tue, 03 Jan 2012 12:00:13 -0000

On 01/03/2012 12:54 PM, Stefan Hajnoczi wrote:
> On Mon, Jan 02, 2012 at 07:00:30PM +0100, Paolo Bonzini wrote:
>>   void notifier_list_add(NotifierList *list, Notifier *notifier)
>>   {
>> -    QTAILQ_INSERT_HEAD(&list->notifiers, notifier, node);
>> +    QLIST_INSERT_HEAD(&list->notifiers, notifier, node);
>>   }
>>
>> -void notifier_list_remove(NotifierList *list, Notifier *notifier)
>> +void notifier_remove(Notifier *notifier)
>
> Why introduce this asymmetry with notifier_list_add() and
> notifier_remove()?  Please make the function names consistent.

Because notifier_list_add adds the notifier to a specific NotifierList; 
notifier_remove removes the notifier from whatever list it is in.

Normally whoever implements notifiers does not have access to the 
NotifierList, so there are wrappers for both notifier_list_add and 
notifier_list_remove.  This patch changes things so that the wrappers 
for notifier_remove are not needed anymore (though this series was 
already big enough, so I left the wrappers in).

Paolo


