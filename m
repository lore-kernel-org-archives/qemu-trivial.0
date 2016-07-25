Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bRiHg-0002jy-6y
	for mharc-qemu-trivial@gnu.org; Mon, 25 Jul 2016 11:59:12 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42616)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1bRiHe-0002i6-3U
	for qemu-trivial@nongnu.org; Mon, 25 Jul 2016 11:59:11 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1bRiHa-0005xX-VI
	for qemu-trivial@nongnu.org; Mon, 25 Jul 2016 11:59:10 -0400
Received: from mx1.redhat.com ([209.132.183.28]:53527)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>)
	id 1bRiHR-0005uk-Tw; Mon, 25 Jul 2016 11:58:58 -0400
Received: from int-mx14.intmail.prod.int.phx2.redhat.com
	(int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 183E76438B;
	Mon, 25 Jul 2016 15:58:57 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-116-47.ams2.redhat.com
	[10.36.116.47])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u6PFwtHf013724
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Mon, 25 Jul 2016 11:58:56 -0400
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id F1F6711AD2BD; Mon, 25 Jul 2016 17:58:54 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Cc: Reda Sallahi <fullmanet@gmail.com>, Kevin Wolf <kwolf@redhat.com>,
	Fam Zheng <famz@redhat.com>, qemu-block@nongnu.org,
	qemu-trivial@nongnu.org, qemu-devel@nongnu.org,
	Max Reitz <mreitz@redhat.com>
References: <20160721084153.16103-1-fullmanet@gmail.com>
	<20160721090721.GA27488@stefanha-x1.localdomain>
Date: Mon, 25 Jul 2016 17:58:54 +0200
In-Reply-To: <20160721090721.GA27488@stefanha-x1.localdomain> (Stefan
	Hajnoczi's message of "Thu, 21 Jul 2016 10:07:21 +0100")
Message-ID: <87twfdg14x.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.5 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.39]);
	Mon, 25 Jul 2016 15:58:57 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] qemu-img: fix error
 messages emitted by img_open()
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial/>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Mon, 25 Jul 2016 15:59:11 -0000

Stefan Hajnoczi <stefanha@redhat.com> writes:

> On Thu, Jul 21, 2016 at 10:41:53AM +0200, Reda Sallahi wrote:
>> img_open_file() and img_open_opts() were printing error messages with a
>> duplicate part because of a wrong use of error_reportf_err() (e.g.
>> qemu-img: Could not open 'foo': Could not open 'foo': No such file or directory)
>> 
>> This change uses error_report_err() instead to eliminate the duplicate part.
>> 
>> Signed-off-by: Reda Sallahi <fullmanet@gmail.com>
>> ---
>>  qemu-img.c | 4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>> 
>> diff --git a/qemu-img.c b/qemu-img.c
>> index 2e40e1f..dc6652d 100644
>> --- a/qemu-img.c
>> +++ b/qemu-img.c
>> @@ -268,7 +268,7 @@ static BlockBackend *img_open_opts(const char *optstr,
>>      options = qemu_opts_to_qdict(opts, NULL);
>>      blk = blk_new_open(NULL, NULL, options, flags, &local_err);
>>      if (!blk) {
>> -        error_reportf_err(local_err, "Could not open '%s': ", optstr);
>> +        error_report_err(local_err);
>>          return NULL;
>>      }
>>      blk_set_enable_write_cache(blk, !writethrough);
>> @@ -295,7 +295,7 @@ static BlockBackend *img_open_file(const char *filename,
>>  
>>      blk = blk_new_open(filename, NULL, options, flags, &local_err);
>>      if (!blk) {
>> -        error_reportf_err(local_err, "Could not open '%s': ", filename);
>> +        error_report(local_err);
>>          return NULL;
>>      }
>>      blk_set_enable_write_cache(blk, !writethrough);
>
> The duplication happens in the "Could not open 'foo'" case, but other
> error cases do not include the filename in the error message.
>
> We would lose information in those error cases since the filename is no
> longer included by qemu-img.c in the error message.

Could you give an example of such an information loss?

> I'm not aware of a clean way to distinguish Error objects.  Maybe
> someone else can suggest one.  Otherwise it may be best to leave the
> code as it is.

If you need to distinguish different kinds of errors to conditionally
rewrite the error message so it makes actual sense, chances are the
error messages that need the rewriting should be improved instead.

A more legitimate case is when a caller needs to handle different errors
differently.  Doesn't occur all that often.

There are two techniques for callers to distinguish different kinds of
Errors:

* ErrorClass, use error_get_class() to retrieve it.  This is actually a
  remnant of the failed "rich" error object idea.  Almost always
  ERROR_CLASS_GENERIC_ERROR, so this is unlikely to help.

* Error code separate from the Error object, e.g. the function returns
  -errno in addition to an Error object.

