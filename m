Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1TaVJd-0001rT-BF
	for mharc-qemu-trivial@gnu.org; Mon, 19 Nov 2012 12:39:25 -0500
Received: from eggs.gnu.org ([208.118.235.92]:34666)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1TaVJV-0001it-Hu
	for qemu-trivial@nongnu.org; Mon, 19 Nov 2012 12:39:23 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1TaVJ7-00046W-Hz
	for qemu-trivial@nongnu.org; Mon, 19 Nov 2012 12:39:12 -0500
Received: from v220110690675601.yourvserver.net ([78.47.199.172]:40309)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>)
	id 1TaVIl-0003qR-DX; Mon, 19 Nov 2012 12:38:31 -0500
Received: from localhost (v220110690675601.yourvserver.net.local [127.0.0.1])
	by v220110690675601.yourvserver.net (Postfix) with ESMTP id
	0D445728003D; Mon, 19 Nov 2012 18:38:18 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at weilnetz.de
Received: from v220110690675601.yourvserver.net ([127.0.0.1])
	by localhost (v220110690675601.yourvserver.net [127.0.0.1])
	(amavisd-new, port 10024)
	with ESMTP id vOYvKImqaXqp; Mon, 19 Nov 2012 18:38:17 +0100 (CET)
Received: from [192.168.178.20] (p5086FAD5.dip.t-dialin.net [80.134.250.213])
	by v220110690675601.yourvserver.net (Postfix) with ESMTPSA id
	EB147728003A; Mon, 19 Nov 2012 18:38:16 +0100 (CET)
Message-ID: <50AA6E88.5050303@weilnetz.de>
Date: Mon, 19 Nov 2012 18:38:16 +0100
From: Stefan Weil <sw@weilnetz.de>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:16.0) Gecko/20121028 Thunderbird/16.0.2
MIME-Version: 1.0
To: Stefan Hajnoczi <stefanha@gmail.com>
References: <1353227175-24596-1-git-send-email-sw@weilnetz.de>
	<20121119113111.GA21658@stefanha-thinkpad.redhat.com>
In-Reply-To: <20121119113111.GA21658@stefanha-thinkpad.redhat.com>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6.x
X-Received-From: 78.47.199.172
Cc: qemu-trivial@nongnu.org, Kevin Wolf <kwolf@redhat.com>,
	Jim Meyering <meyering@redhat.com>, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH] block: Fix regression for MinGW
 (assertion caused by short string)
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
X-List-Received-Date: Mon, 19 Nov 2012 17:39:23 -0000

Am 19.11.2012 12:31, schrieb Stefan Hajnoczi:
> On Sun, Nov 18, 2012 at 09:26:15AM +0100, Stefan Weil wrote:
>> The local string tmp_filename is passed to function get_tmp_filename
>> which expects a string with minimum size MAX_PATH for w32 hosts.
>>
>> MAX_PATH is 260 and PATH_MAX is 259, so tmp_filename was too short.
>>
>> Commit eba25057b9a5e19d10ace2bc7716667a31297169 introduced this
>> regression.
>>
>> Signed-off-by: Stefan Weil <sw@weilnetz.de>
>> ---
>>   block.c |    2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/block.c b/block.c
>> index 49dd6bb..8739635 100644
>> --- a/block.c
>> +++ b/block.c
>> @@ -787,7 +787,7 @@ int bdrv_open(BlockDriverState *bs, const char *filename, int flags,
>>                 BlockDriver *drv)
>>   {
>>       int ret;
>> -    char tmp_filename[PATH_MAX];
>> +    char tmp_filename[PATH_MAX + 1];
> This is not maintainable - the patch is making an assumption about the relative
> values of MAX_PATH and PATH_MAX.  There is no comment explaining this so it's
> likely to be changed and break in the future again.

The relation between MAX_PATH and PATH_MAX seems to be well definedand
is valid for w32 and w64, so there is no need to make any assumption:

buffers must allocate MAX_PATH elements for up to PATH_MAX
character entries plus a terminating 0.

I considered writing a comment, but decided not to do so because
caller and called function are in the same file and most people
are not very interested in Windows peculiarities.

The code in block/vvfat.c which uses a length of 1024without
explanation is worse.

>
> A clean solution is to change get_tmp_filename() so the caller doesn't need to
> pass in a fixed size:
>
> /*
>   * Create a uniquely-named empty temporary file.
>   * Return 0 upon success, otherwise a negative errno value.
>   *
>   * The filename must be freed with g_free() when it is no longer needed.
>   */
> int get_tmp_filename(char **filename)

For block/vvfat, that would even simplify the code.

>
> The existing get_tmp_filename() code has another problem.  Here is the Windows
> get_tmp_filename() code:
>
>      char temp_dir[MAX_PATH];
>      /* GetTempFileName requires that its output buffer (4th param)
>         have length MAX_PATH or greater.  */
>      assert(size >= MAX_PATH);
>      return (GetTempPath(MAX_PATH, temp_dir)
>              && GetTempFileName(temp_dir, "qem", 0, filename)
>              ? 0 : -GetLastError());
>
> The assert has an off-by-one error because the documentation says:
>
>    "This buffer should be MAX_PATH characters to accommodate the path plus the
>     terminating null character."
>    http://msdn.microsoft.com/en-us/library/windows/desktop/aa364991(v=vs.85).aspx

No. The documentation can be read in two ways:

   "This buffer should be (MAX_PATH characters) to accommodate (the path plus the
    terminating null character)."


   "This buffer should be (MAX_PATH characters to accommodate the path) plus (the
    terminating null character)."


The first one matches the current code and also the example from MS:
http://msdn.microsoft.com/en-us/library/windows/desktop/aa363875%28v=vs.85%29.aspx

In a short experiment, I was able to create filenames with up to 228 
characters
using GetTempFileName, so even 229 bytes instead of MAX_PATH (260) would 
be sufficient.

> Since the function returns -errno the assert could be turned into:
>
>    /* GetTempFileName requires that its output buffer (4th param)
>       have length MAX_PATH + 1 or greater.  */
>    if (size < MAX_PATH + 1) {
>        return -ENOSPC;
>    }
>
> Stefan

"if (size < MAX_PATH) {"

I'd still prefer the assertion because that is not a general purpose
library function but a QEMU internal function which must be called
with correct parameters. Here raising an assertion is better than
silently returning an error status. Of course we could do both.

Any patch which fixes this regression for MinGW is fine -
my patch was simply the smallest possible change to achieve this goal,
and I still think that it is sufficient.

If we want a better solution, we should also consider g_mkstemp
and related functions like g_file_open_tmp. We could also modify
bdrv_create to allow a NULL filename which is interpreted as a
temporary filename. IMHO that would be a good solution for the
future (= after 1.3). Feel free to add a TODO comment to the
code in my patch.

Regards,
Stefan


