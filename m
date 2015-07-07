Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZCVoW-0003qw-V9
	for mharc-qemu-trivial@gnu.org; Tue, 07 Jul 2015 12:33:45 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44116)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jsnow@redhat.com>) id 1ZCVoU-0003oL-HR
	for qemu-trivial@nongnu.org; Tue, 07 Jul 2015 12:33:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <jsnow@redhat.com>) id 1ZCVoT-0007Hs-If
	for qemu-trivial@nongnu.org; Tue, 07 Jul 2015 12:33:42 -0400
Received: from mx1.redhat.com ([209.132.183.28]:32995)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jsnow@redhat.com>)
	id 1ZCVoO-0007E5-61; Tue, 07 Jul 2015 12:33:36 -0400
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	by mx1.redhat.com (Postfix) with ESMTPS id 3685038880B;
	Tue,  7 Jul 2015 16:33:35 +0000 (UTC)
Received: from scv.usersys.redhat.com (dhcp-17-29.bos.redhat.com [10.18.17.29])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t67GXWCM012503; Tue, 7 Jul 2015 12:33:32 -0400
Message-ID: <559BFF5B.4050405@redhat.com>
Date: Tue, 07 Jul 2015 12:33:31 -0400
From: John Snow <jsnow@redhat.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.7.0
MIME-Version: 1.0
To: Luiz Capitulino <lcapitulino@redhat.com>
References: <1435775149-17285-1-git-send-email-jsnow@redhat.com>
	<20150702113102.39ab42a5@redhat.com>
In-Reply-To: <20150702113102.39ab42a5@redhat.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, mjt@tls.msk.ru, qemu-devel@nongnu.org,
	Markus Armbruster <armbru@redhat.com>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] qmp-shell: add documentation
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
X-List-Received-Date: Tue, 07 Jul 2015 16:33:43 -0000



On 07/02/2015 11:31 AM, Luiz Capitulino wrote:
> On Wed,  1 Jul 2015 14:25:49 -0400
> John Snow <jsnow@redhat.com> wrote:
> 
>> I should probably document the changes that were made.
>>
>> Signed-off-by: John Snow <jsnow@redhat.com>
> 
> Looks good to me, CC'ing maintainer.
> 

Whoops, didn't realize Markus took this file over, too. Sorry Luiz.

Markus, would you consider staging this? It's purely a documentation
update for only a dev tool, so it doesn't really matter /when/ it lands
either way, just shoring up some changes I made a while back to the
interpreter here.

tldr: "ping"

>> ---
>>  scripts/qmp/qmp-shell | 35 +++++++++++++++++++++++++++++++++++
>>  1 file changed, 35 insertions(+)
>>
>> diff --git a/scripts/qmp/qmp-shell b/scripts/qmp/qmp-shell
>> index 65280d2..fa39bf0 100755
>> --- a/scripts/qmp/qmp-shell
>> +++ b/scripts/qmp/qmp-shell
>> @@ -29,6 +29,41 @@
>>  # (QEMU) device_add driver=e1000 id=net1
>>  # {u'return': {}}
>>  # (QEMU)
>> +#
>> +# key=value pairs also support Python or JSON object literal subset notations,
>> +# without spaces. Dictionaries/objects {} are supported as are arrays [].
>> +#
>> +#    example-command arg-name1={'key':'value','obj'={'prop':"value"}}
>> +#
>> +# Both JSON and Python formatting should work, including both styles of
>> +# string literal quotes. Both paradigms of literal values should work,
>> +# including null/true/false for JSON and None/True/False for Python.
>> +#
>> +#
>> +# Transactions have the following multi-line format:
>> +#
>> +#    transaction(
>> +#    action-name1 [ arg-name1=arg1 ] ... [arg-nameN=argN ]
>> +#    ...
>> +#    action-nameN [ arg-name1=arg1 ] ... [arg-nameN=argN ]
>> +#    )
>> +#
>> +# One line transactions are also supported:
>> +#
>> +#    transaction( action-name1 ... )
>> +#
>> +# For example:
>> +#
>> +#     (QEMU) transaction(
>> +#     TRANS> block-dirty-bitmap-add node=drive0 name=bitmap1
>> +#     TRANS> block-dirty-bitmap-clear node=drive0 name=bitmap0
>> +#     TRANS> )
>> +#     {"return": {}}
>> +#     (QEMU)
>> +#
>> +# Use the -v and -p options to activate the verbose and pretty-print options,
>> +# which will echo back the properly formatted JSON-compliant QMP that is being
>> +# sent to QEMU, which is useful for debugging and documentation generation.
>>  
>>  import qmp
>>  import json
> 
> 

