Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1U2MAw-000674-GP
	for mharc-qemu-trivial@gnu.org; Mon, 04 Feb 2013 08:33:34 -0500
Received: from eggs.gnu.org ([208.118.235.92]:59963)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <chouteau@adacore.com>) id 1U2MAn-0005iq-1m
	for qemu-trivial@nongnu.org; Mon, 04 Feb 2013 08:33:30 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <chouteau@adacore.com>) id 1U2MAl-0006w2-PR
	for qemu-trivial@nongnu.org; Mon, 04 Feb 2013 08:33:24 -0500
Received: from mel.act-europe.fr ([194.98.77.210]:32949)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <chouteau@adacore.com>)
	id 1U2MAi-0006vV-O7; Mon, 04 Feb 2013 08:33:20 -0500
Received: from localhost (localhost [127.0.0.1])
	by filtered-smtp.eu.adacore.com (Postfix) with ESMTP id E767A290052;
	Mon,  4 Feb 2013 14:33:29 +0100 (CET)
X-Virus-Scanned: amavisd-new at eu.adacore.com
Received: from mel.act-europe.fr ([127.0.0.1])
	by localhost (smtp.eu.adacore.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EjOeM9LOtJC4; Mon,  4 Feb 2013 14:33:29 +0100 (CET)
Received: from [10.10.1.88] (pompomgalli.act-europe.fr [10.10.1.88])
	(using TLSv1 with cipher DHE-RSA-CAMELLIA256-SHA (256/256 bits))
	(No client certificate requested)
	by mel.act-europe.fr (Postfix) with ESMTP id CF0FE290007;
	Mon,  4 Feb 2013 14:33:29 +0100 (CET)
Message-ID: <510FB89E.1080504@adacore.com>
Date: Mon, 04 Feb 2013 14:33:18 +0100
From: Fabien Chouteau <chouteau@adacore.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:17.0) Gecko/20130106 Thunderbird/17.0.2
MIME-Version: 1.0
To: Markus Armbruster <armbru@redhat.com>
References: <1359738831-7232-1-git-send-email-chouteau@adacore.com>
	<20130204083900.GB5216@stefanha-thinkpad.redhat.com>
	<87k3qov047.fsf@blackfin.pond.sub.org>
	<510F9B09.7030804@adacore.com>
	<87obg0s1wf.fsf@blackfin.pond.sub.org>
In-Reply-To: <87obg0s1wf.fsf@blackfin.pond.sub.org>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6.x
X-Received-From: 194.98.77.210
Cc: qemu-trivial@nongnu.org, kwolf@redhat.com, qemu-devel@nongnu.org,
	Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] get_tmp_filename: add
	explicit error message
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
X-List-Received-Date: Mon, 04 Feb 2013 13:33:31 -0000

On 02/04/2013 01:24 PM, Markus Armbruster wrote:
> Fabien Chouteau <chouteau@adacore.com> writes:
> 
>> On 02/04/2013 11:34 AM, Markus Armbruster wrote:
>>
>> Why? The caller doesn't know the difference between Windows/Linux
>> implementation. And the error handling would have to be duplicated.
> 
> The function's (implied) contract is to return an error code without
> printing anything.  If you want to change the contract to include
> reporting the error, you need to implement it both for both arms of the
> #ifdef.  You also have to demonstrate that all callers are happy with
> the change of contract.
> 
> Regardless, printing to stderr is wrong.  The function can be called on
> behalf of a monitor command, and then the error needs to be printed to
> the correct monitor.  error_report() can do that for you, and more.
> 

Alright, so I will use error_report() and do it for both Linux and Windows.

>> It's not the first time I add error output in Windows code. Specially in
>> block/, when there's an error, the only thing you get is: "operation not
>> permitted". It's not very helpful and you have to dig in the code to
>> find which function failed.
> 
> Good error reporting is hard.  Knowledge about the error and its context
> gets lost as you move up the call chain.  Knowledge about how to report
> errors gets lost as you move down.
> 

You're right, and in my opinion, no error reporting is the worst case.

-- 
Fabien Chouteau

