Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1TvwOy-00016b-Cx
	for mharc-qemu-trivial@gnu.org; Thu, 17 Jan 2013 15:49:32 -0500
Received: from eggs.gnu.org ([208.118.235.92]:39019)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <blauwirbel@gmail.com>) id 1TvwOw-00012J-Ao
	for qemu-trivial@nongnu.org; Thu, 17 Jan 2013 15:49:31 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <blauwirbel@gmail.com>) id 1TvwOv-0004x3-AF
	for qemu-trivial@nongnu.org; Thu, 17 Jan 2013 15:49:30 -0500
Received: from mail-da0-f44.google.com ([209.85.210.44]:48560)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <blauwirbel@gmail.com>)
	id 1TvwOs-0004wG-2T; Thu, 17 Jan 2013 15:49:26 -0500
Received: by mail-da0-f44.google.com with SMTP id z20so1283387dae.17
	for <multiple recipients>; Thu, 17 Jan 2013 12:49:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type;
	bh=hdGaY+BECB5edDf8dKMuVFliQS9zO9cgvqX/raFPHBA=;
	b=lSh02w2kwHj5Dn7RvFbhd9LcXv0etdLdx9fAfjKP4nfsE9kmlytdqb7kHVGfbmR9vA
	mQvDtjlVRpyG8qDvKWjYlxmS/+usUynskK8vI+UK/T1EhBhigIF+JzueQA49mKH46qru
	3voT5twkZaim3ik66w+gi2sGiH6UDpZvAZpqraHynbcWdmB1IWY5loleCxz9ZwHoCKpT
	e5tqv3NAIxw8ZkbGiH/ZPQMKoxRKBAQ3oZuenDgostO/Hp7dXPzSb3sWnrgkwH5ujUWo
	kJqSWo4kepfaTKEAWpatB10madMub8jxKsszxrliAg2Fs61NjA9VVEBoUFaK50heEZMM
	Wlzw==
X-Received: by 10.68.134.130 with SMTP id pk2mr17110167pbb.125.1358455764898; 
	Thu, 17 Jan 2013 12:49:24 -0800 (PST)
MIME-Version: 1.0
Received: by 10.68.208.168 with HTTP; Thu, 17 Jan 2013 12:49:04 -0800 (PST)
In-Reply-To: <87a9s9jen6.fsf@blackfin.pond.sub.org>
References: <1358346998-26328-1-git-send-email-armbru@redhat.com>
	<1358346998-26328-9-git-send-email-armbru@redhat.com>
	<50F6CCE1.4020503@redhat.com>
	<87a9s9jen6.fsf@blackfin.pond.sub.org>
From: Blue Swirl <blauwirbel@gmail.com>
Date: Thu, 17 Jan 2013 20:49:04 +0000
Message-ID: <CAAu8pHtbjMYxJ79BDaZiymRFiHSZdeD90KGNFbEqYYRzjjSBig@mail.gmail.com>
To: Markus Armbruster <armbru@redhat.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 209.85.210.44
Cc: qemu-trivial@nongnu.org, Eric Blake <eblake@redhat.com>,
	qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 08/11] qemu-log: Plug
	trivial memory leak in cpu_set_log_filename()
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
X-List-Received-Date: Thu, 17 Jan 2013 20:49:31 -0000

On Wed, Jan 16, 2013 at 4:06 PM, Markus Armbruster <armbru@redhat.com> wrote:
> Eric Blake <eblake@redhat.com> writes:
>
>> On 01/16/2013 07:36 AM, Markus Armbruster wrote:
>>> Signed-off-by: Markus Armbruster <armbru@redhat.com>
>>> ---
>>>  qemu-log.c | 13 +++++++++----
>>>  1 file changed, 9 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/qemu-log.c b/qemu-log.c
>>> index 64a1b88..1eadf1b 100644
>>> --- a/qemu-log.c
>>> +++ b/qemu-log.c
>>> @@ -21,10 +21,12 @@
>>>  #include "qemu/log.h"
>>>
>>>  #ifdef WIN32
>>> -static const char *logfilename = "qemu.log";
>>> +#define DEFAULT_LOGFILENAME = "qemu.log"
>>
>> Syntax error.
>
> How embarrassing.  Unfortunately, it compiles...  I'll respin.
>
>>> @@ -54,11 +56,13 @@ void qemu_log_mask(int mask, const char *fmt, ...)
>>>  /* enable or disable low levels log */
>>>  void qemu_set_log(int log_flags, bool use_own_buffers)
>>>  {
>>> +    const char *fname = logfilename ?: DEFAULT_LOGFILENAME;
>>
>> ?: is not C99, but a GNU extension.  What is our policy on using it?
>
> We got several dozen instancess of ?: spread over the tree.

I'd not add any more. It's a bad idea to add more dependencies to
specific tools than is necessary.

