Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YGINY-0008PY-Ek
	for mharc-qemu-trivial@gnu.org; Tue, 27 Jan 2015 21:29:16 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39119)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <gang.chen@sunrus.com.cn>) id 1YGINU-0008FM-LP
	for qemu-trivial@nongnu.org; Tue, 27 Jan 2015 21:29:14 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <gang.chen@sunrus.com.cn>) id 1YGINS-00077e-R7
	for qemu-trivial@nongnu.org; Tue, 27 Jan 2015 21:29:12 -0500
Received: from out1134-251.mail.aliyun.com ([42.120.134.251]:30949)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <gang.chen@sunrus.com.cn>)
	id 1YGINM-00076J-14; Tue, 27 Jan 2015 21:29:05 -0500
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.07423414|-1; FP=0|0|0|0|0|-1|-1|-1;
	HT=r41g03021; MF=gang.chen@sunrus.com.cn; PH=DS; RN=4; RT=4;
	SR=0; 
Received: from
	ShengShiZhuChengdeMacBook-Pro.local(mailfrom:gang.chen@sunrus.com.cn
	ip:124.127.118.42) by smtp.aliyun-inc.com(10.194.100.37);
	Wed, 28 Jan 2015 10:28:58 +0800
Message-ID: <54C84B36.10500@sunrus.com.cn>
Date: Wed, 28 Jan 2015 10:36:38 +0800
From: Chen Gang S <gang.chen@sunrus.com.cn>
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10;
	rv:31.0) Gecko/20100101 Thunderbird/31.4.0
MIME-Version: 1.0
To: Michael Tokarev <mjt@tls.msk.ru>, riku.voipio@iki.fi
References: <54C21BE5.9080100@sunrus.com.cn>
	<54C770AD.6000607@msgid.tls.msk.ru>
In-Reply-To: <54C770AD.6000607@msgid.tls.msk.ru>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6.x
X-Received-From: 42.120.134.251
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, qemu-devel <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [PATCH v2] linux-user/syscall.c: Free the vec[i]
 in failure processing code block
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
X-List-Received-Date: Wed, 28 Jan 2015 02:29:14 -0000


Firstly, thank you for your work about the related patches and replying
so much details.

On 1/27/15 19:04, Michael Tokarev wrote:
> 23.01.2015 13:01, Chen Gang S wrote:
>> When failure occurs during allocating vec[i], also need free all
>> allocated vec[i] in failure processing code block before return.
>>
>> In unlock_user(), it will check vec[i].iov_base whether is NULL, so need
>> not check it again outside.
>>
>> If error is EFAULT when "i == 0", vec[i].iov_base is NULL, then can just
>> skip it, so can still use "while (--i >= 0)" for the free looping.
> 
> Oh well.  I think you need to improve your English just a little bit... ;)
> 

Yeah, I shall always be improving my English :-).

 - Communicate with open source with English.

 - Listen/read English version Holy Bible when I am in subway between my
   home and my office.

 - Sometimes can get some suggestions (e.g. you in open source), they
   are welcome, and they are really useful to me.

> First of all, the talk here is about locking and unlocking, not about
> allocating and freeing.  So not "free", but "unlock", or else it
> becomes a bit confusing, since you're adding unlock calls, not free.
> 

OK, what you said above sounds reasonable to me (in the unlock function,
the code really free resources, though).

> Now, the language part.  Please let me show your typical examples.
> There are several typical kinds of these:
> 
>   When failure occurs during allocating vec[i], also need free all
>   allocated vec[i] in failure processing code block before return.
> 
> "need _to_ free", it is always "need TO do something", since the
> verb after need is always infinitive.  There are several words
> like this -- need to, have to, want to, -- when used in a similar
> construct.  Ofcourse I don't talk about other usage -- like "I
> need coffee".  Another alternative is to use word "should" --
> "we should free ...".
> 

For me, 'need' can also be used like 'can', 'may' or 'must', e.g.:

  A: "Must I do it?"
  B: "No, you needn't" -- "No, you needn't do it".

So for me, "I need do it" is also correct, just like "I can do it", or
"I must do it", or "I should do it".

> "allocating vec[i]" -- "of" is missing, "allocating OF vec[i]".
> Alternative -- "vec[i] allocating", or better yet, "vec[i]
> allocation".  This is like making a noun from a verb -- "to
> allocate" is a verb (infinitive), "allocating" is the same
> verb in present continous tense, and "allocation" is a process,
> like a noun.  It is during this process we hit the error.
> 

OK, thanks, what you said above sounds reasonable to me. I shall notice
about infinitive verb, next time.

> In this part of sentence, you don't have a subject.  English statements
> almost always have a subject.  In other words, _whp_ need to free?
> Here, it is possible to use the word "we", like "we need to free..".
> For a subject-less construct, it is possible to use construct "there
> is" -- in this case it will be "there's a need to free..", but it
> has more words, and the word "we" is short and adequate, since we
> are the programmers who wrote this code.
> 

OK, thanks, what you said above sounds reasonable to me, I shall notice
about "do not miss subject in formal using".

> So a bit better (from English perspective anyway) version of this
> your statement is:
> 
>   When failure occurs during vec[i] allocation, we need to free
>   all allocated vec[i] in failure processing code block before return.
> 
> (I omitted "also", but that wasn't really necessary.  I _think_
> it referred to the unlocking/freeing of vec itself -- in other
> words, we should not only free vec, but ALSO every individual
> vec[i].)
> 
> It is still quite a bit "raw", and unusual usage of English,
> but it is more english-like.
> 
>>From technical standpoint, I think, it is sufficient to say
> something like "in failure path we forgot to unlock starting
> vec[i] elements which we successfully locked" -- this should
> be a (more or less) good English, short, and correct technically.
> 

OK.

> 
>   In unlock_user(), it will check vec[i].iov_base whether is NULL, so need
>   not check it again outside.
> 
> "In unlock_user(), it will.." -- "it" here is not like in "it rains",
> which is more or less subject-less statement.  Here you can use "it"
> when you "named" or mentioned it previously.  For example, "the table
> was square, it had long curly legs" -- here, "it" refers to "table".
> So the more english-correct usage is either "unlock_user() will..." --
> making "unlock_user()" a subject -- not very common for a function;
> or - a bit more clumsy - "Code in unlock_user(), it will.." -- making
> "Code" a subject.  Or combining the two, "Code in unlock_user() will.." -
> this is the most correct but a bit too long.  Note that if you omit
> the first "In", last "outside" becomes stray.
> 

OK, We need the subject in formal using.

> Now, "will check THAT <.> is NULL", or "will check IF <.> is NULL",
> or "will check whether <.> is NULL", or other variants.  Note the
> placement of words.  Alternative is "will check <.> FOR NULLiness"
> (I'm not really sure it is the correct form).  I think it should be
> clear what's the difference between two word placements.
> 

Excuse me, I am not quite sure about it: I can not find NULLiness
(nulliness) in qemu git comments or in Linux kernel git comments.

> "so need not check" -- the same 2 probs as before.  No subject, and
> a verb after "need" should be in infinitive form.  Correct version is
> "so there's no need to check", or, making "check" a subject (noun
> from verb), "so [this] check is not needed".
> 

It is the same discussion in some area above of this thread.

> But this whole sentense is a bit stray by itself.  When reading it
> I thought that it is the current code in lock_iovec() which does
> something unnecessary (checking whether iov_base is NULL).  But it
> turned out that this way you describe why you didn't add such a
> check in NEW code this patch is adding.  This is a bit more difficult
> to describe and to suggest a better version, because there's no
> obvious grammar rule to follow.  Maybe it is just better to put
> this statement into code comment, not into a commit message, or
> add a line in the commit message telling that the below is about
> how we do what needs to be done.
> 
> So anyway, my suggested wording is something like:
> 
>  Since unlock_user() checks whether iov_base is NULL, there's no
>  need to do it before calling that function.
> 

For me, if the final code is still simple and clear enough, I try to
avoid to add comments in the internal area within functions.

If there may be any doubts for the code modification, I will add related
comments for the patch (commit comments), not for the code.

I guess, after modification, the code is still clear enough, do not need
any code comments.

> 
> 
>   If error is EFAULT when "i == 0", vec[i].iov_base is NULL, then can just
>   skip it, so can still use "while (--i >= 0)" for the free looping.
> 
> "then can skip" -- again, no subject.  "Then we can skip it", "Then it
> is okay to skip it" and so on.  "So can still use" - the same.
> 

OK, missing subject in formal using.

> This is a good candidate for code comment actually, not for a commit
> message.  Again, I thought it was about existing code, but in fact
> it describes the code you're adding, "proving" your code.
> 
> Maybe something like this:
> 
>  In a corner case, if error occurs on first iteration (i == 0),
>  vec[i].iov_base will be NULL and there's no need to unlock it,
>  so it is still okay to use (--i >= 0) condition in the loop.
> 
> But actually, both these statements aren't really necessary,
> I think.
> 

For me, these statements are not necessary as code comments, but for
sending patch, I still suggest to provide them, it will let other
members more easier to review the patch.

For applying patch, the final appliers can deside whether skip these
statements or not.

> 
> And one more thing: The subject line.  You jumped from a filename
> (quite large!) right to a local variable.  So one may think that
> this whole file contains just one small function with a variable
> which needs to be freed... ;)   I'd use something like this:
> 
>  linux-user/syscall.c: unlock vec[i] in failure processing code in lock_iovec()
> 
> or
> 
>  linux-user/syscall.c: lock_iovec: unlock vec[i] in failure processing code
> 
> that's if you really want to go to this level of details up to
> variable name which is being unlocked/freed -- this way you
> cover a gap between high-level (file) and too low-level (variable
> name) which you're jumping over.  Alternatively, less details
> is possible too, like:
> 
>  linux-user/syscall.c: lock_iovec: fix error path resource leak
> 

OK, thanks, what you said above sounds reasonable to me, I shall notice
about it, next time.

> 
> Please don't get me wrong -- I'm not saying "you're bad" or
> anything like that, I'm trying to help -- or else I'd not write
> so much text (it takes some time too ;).  I didn't want to
> offend you in any way.  And more: I'm not a native English
> speaker myself, my English is _far_ from perfect, I make
> many mistakes too.. So maybe I don't even have a right to
> correct someone else's mistakes... ;)
> 

I am sure, I do not misunderstand your suggestions. And still welcome
any related suggestions, although I am not quite sure whether another
members may be boring in qemu mailing list.


> Anyway.  I applied the patch, keeping your semantical wording
> but fixing the obvious grammar problems.  Thank you for the
> work!
>

OK, thank you too.
 
-- 
Chen Gang

Open, share, and attitude like air, water, and life which God blessed

