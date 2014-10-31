Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XkDuL-0000nz-F8
	for mharc-qemu-trivial@gnu.org; Fri, 31 Oct 2014 11:14:33 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34537)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1XkDsm-0000qf-PU
	for qemu-trivial@nongnu.org; Fri, 31 Oct 2014 11:14:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Xk6Rm-0005Xo-PR
	for qemu-trivial@nongnu.org; Fri, 31 Oct 2014 03:16:39 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:45488)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1Xk6Rh-0005JJ-GT; Fri, 31 Oct 2014 03:16:29 -0400
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 22B87470FA;
	Fri, 31 Oct 2014 10:16:19 +0300 (MSK)
Message-ID: <54533742.1000109@msgid.tls.msk.ru>
Date: Fri, 31 Oct 2014 10:16:18 +0300
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Icedove/24.8.1
MIME-Version: 1.0
To: Gonglei <arei.gonglei@huawei.com>
References: <cover.1414681502.git.mjt@msgid.tls.msk.ru>
	<dc4522b965468522221bd08231b169b1a3e28c69.1414681502.git.mjt@msgid.tls.msk.ru>
	<5453178B.2040504@huawei.com>
In-Reply-To: <5453178B.2040504@huawei.com>
X-Enigmail-Version: 1.6
OpenPGP: id=804465C5
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: "qemu-trivial@nongnu.org" <qemu-trivial@nongnu.org>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	Markus Armbruster <armbru@redhat.com>
Subject: Re: [Qemu-trivial] [PATCH 3/4] pidfile: stop making pidfile error a
	special case
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
X-List-Received-Date: Fri, 31 Oct 2014 15:14:31 -0000

31.10.2014 08:00, Gonglei wrote:
> On 2014/10/30 23:07, Michael Tokarev wrote:
> 
>> In case of -daemonize, we write non-zero to the daemon
>> pipe only if pidfile creation failed, so the parent will
>> report error about pidfile problem.  There's no need to
>> make special case for this, since all other errors are
>> reported by the child just fine.  Let the parent report
>> error and simplify logic in os_daemonize().
>>
>> This way, we don't need os_pidfile_error() function, since
>> it only prints error now, so put the error reporting printf
>> into the only place where qemu_create_pidfile() is called,
>> in vl.c.
>>
>> While at it, fix wrong identation in os_daemonize().
> 
> s/identation/identification/

No, the original word was the right one.

>> Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
>> ---
>>  include/qemu-common.h |    1 -
>>  os-posix.c            |   29 ++++++-----------------------
>>  os-win32.c            |    5 -----
>>  vl.c                  |    2 +-
>>  4 files changed, 7 insertions(+), 30 deletions(-)
>>
>> diff --git a/include/qemu-common.h b/include/qemu-common.h
>> index b87e9c2..f862214 100644
>> --- a/include/qemu-common.h
>> +++ b/include/qemu-common.h
>> @@ -357,7 +357,6 @@ char *qemu_find_file(int type, const char *name);
>>  void os_setup_early_signal_handling(void);
>>  char *os_find_datadir(void);
>>  void os_parse_cmd_args(int index, const char *optarg);
>> -void os_pidfile_error(void);
>>  
>>  /* Convert a byte between binary and BCD.  */
>>  static inline uint8_t to_bcd(uint8_t val)
>> diff --git a/os-posix.c b/os-posix.c
>> index eada8d4..a3b96d9 100644
>> --- a/os-posix.c
>> +++ b/os-posix.c
>> @@ -221,18 +221,12 @@ void os_daemonize(void)
>>              do {
>>                  len = read(fds[0], &status, 1);
>>              } while (len < 0 && errno == EINTR);
>> -            if (len != 1) {
>> -                exit(1);
>> -            }
> 
> Does this check need to be removed?

Yes, because...
> 
>> -            else if (status == 1) {
>> -                fprintf(stderr, "Could not acquire pidfile\n");
>> -                exit(1);
>> -            } else {
>> -                exit(0);
>> -            }
>> -            } else if (pid < 0) {
>> -                exit(1);
>> -            }
>> +
>> +            exit(len == 1 && status == 0 ? 0 : 1);

...it is checked here, note the 'len == 1' part of the condition.

And here comes the wrong original identation -- this part of "else"
was indented once too many:

>> +
>> +        } else if (pid < 0) {
>> +            exit(1);
>> +        }
>>  

Thanks,

/mjt


