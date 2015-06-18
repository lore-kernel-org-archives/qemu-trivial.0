Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Z5YPn-0007St-Iu
	for mharc-qemu-trivial@gnu.org; Thu, 18 Jun 2015 07:55:27 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42768)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1Z5YPf-0007JI-Nv
	for qemu-trivial@nongnu.org; Thu, 18 Jun 2015 07:55:25 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1Z5YPe-0004zQ-Kk
	for qemu-trivial@nongnu.org; Thu, 18 Jun 2015 07:55:19 -0400
Received: from mx1.redhat.com ([209.132.183.28]:52847)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>)
	id 1Z5YPY-0004wp-I0; Thu, 18 Jun 2015 07:55:12 -0400
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	by mx1.redhat.com (Postfix) with ESMTPS id C5C46388865;
	Thu, 18 Jun 2015 11:55:11 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-116-36.ams2.redhat.com
	[10.36.116.36])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t5IBtAcG015500
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Thu, 18 Jun 2015 07:55:11 -0400
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id 7D9E5303F904; Thu, 18 Jun 2015 13:55:09 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-trivial <qemu-trivial@nongnu.org>
References: <1432749229-4861-1-git-send-email-armbru@redhat.com>
	<87y4jki2jy.fsf@blackfin.pond.sub.org>
Date: Thu, 18 Jun 2015 13:55:09 +0200
In-Reply-To: <87y4jki2jy.fsf@blackfin.pond.sub.org> (Markus Armbruster's
	message of "Tue, 16 Jun 2015 08:34:57 +0200")
Message-ID: <87twu5s02q.fsf@blackfin.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.3 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH] Revert "guest agent: remove g_strcmp0
	usage"
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
X-List-Received-Date: Thu, 18 Jun 2015 11:55:25 -0000

Falling back to qemu-trivial, hope that's okay.

Markus Armbruster <armbru@redhat.com> writes:

> Ping?
>
> Markus Armbruster <armbru@redhat.com> writes:
>
>> Since we now require GLib 2.22+ (commit f40685c), we don't have to
>> work around lack of g_strcmp0() anymore.
>>
>> This reverts commit 8f4774789947bc4bc4c8d026a289fe980d3d2ee1.
>>
>> Conflicts:
>> 	qemu-ga.c
>>
>> Signed-off-by: Markus Armbruster <armbru@redhat.com>
>> ---
>>  qga/main.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/qga/main.c b/qga/main.c
>> index 9939a2b..0b788e1 100644
>> --- a/qga/main.c
>> +++ b/qga/main.c
>> @@ -274,7 +274,7 @@ static void ga_log(const gchar *domain, GLogLevelFlags level,
>>  
>>      level &= G_LOG_LEVEL_MASK;
>>  #ifndef _WIN32
>> -    if (domain && strcmp(domain, "syslog") == 0) {
>> +    if (g_strcmp0(domain, "syslog") == 0) {
>>          syslog(LOG_INFO, "%s: %s", level_str, msg);
>>      } else if (level & s->log_level) {
>>  #else

